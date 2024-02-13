import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_esgi/exceptions/auth/bad_request_exception.dart';
import 'package:flutter_esgi/exceptions/auth/invalid_credentials_exception.dart';
import 'package:flutter_esgi/http/http_utils.dart';
import 'package:flutter_esgi/models/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataSource {
  Future<Account> getAccountInfoFromToken(String token) async {
    try {
      final response = await Http.getApiWithToken(token).get("/auth/me");
      return Account.fromJson(response.data as Map<String, dynamic>);
    } catch (err) {
      rethrow;
    }
  }

  Future<AuthToken> signIn(String? email, String? password) async {
    LoginData data;
    try {
      data = LoginData(email: email, password: password);
      var dio = Http.getApi();
      final response = await dio.post("/auth/login", data: jsonEncode(data));

      return AuthToken.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw InvalidCredentialsException();
      }
      if (e.response?.statusCode == 400) {
        throw BadRequestException();
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthToken> signUp(String name, String email, String password) async {
    SignupData data = SignupData(name: name, email: email, password: password);
    try {
      final response =
          await Http.getApi().post("/auth/signup", data: jsonEncode(data));
      return AuthToken.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw InvalidCredentialsException();
      }
      if (e.response?.statusCode == 400) {
        throw BadRequestException();
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  String _getEmailFromCreds(String creds) {
    return creds.isNotEmpty ? creds.substring(0, creds.lastIndexOf(":")) : "";
  }

  String _getPasswordFromCreds(String creds) {
    return creds.isNotEmpty
        ? creds.substring(creds.lastIndexOf(":"), creds.length - 1)
        : "";
  }
}
