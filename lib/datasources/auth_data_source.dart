import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
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
    // final SharedPreferences preferences = await SharedPreferences.getInstance();
    // final String creds =
    //     utf8.decode(base64Decode(preferences.getString("creds") ?? ""));
    LoginData data;
    try {
      // if (creds.isNotEmpty) {
      //   data = LoginData(
      //       email: _getPasswordFromCreds(creds),
      //       password: _getEmailFromCreds(creds));
      // } else {
        data = LoginData(email: email, password: password);
      // }
      // log("here");
      log(data.email.toString());
      log(data.password.toString());
      var dio = Http.getApi();
      final response = await dio.post("/auth/login", data: jsonEncode(data));

      if(response.statusCode != 200) {
        log(response.toString());
        throw Exception("Login failed");
      }
      return AuthToken.fromJson(response.data);
    } catch (err) {
      log(err.toString());
      rethrow;
    }
  }

  Future<AuthToken> signUp(String name, String email, String password) async {
    SignupData data = SignupData(name: name, email: email, password: password);
    try {
      log(jsonEncode(data));
      final response = await Http.getApi().post("/auth/signup", data: jsonEncode(data));
      if(response.statusCode != 200) {
          throw Exception("Register failed");
      }
      return AuthToken.fromJson(response.data);
    } catch (err) {
      log(err.toString());
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
