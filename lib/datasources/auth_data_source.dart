import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../http/http_utils.dart';
import '../models/account.dart';

class AuthDataSource {
  Future<Account> getAccountInfoFromToken(String token) async {
    try {
      final response = await Http.getApiWithToken(token).get("/auth/me");
      return Account.fromJson(response.data as Map<String, dynamic>);
    } catch (err) {
      rethrow;
    }
  }

  Future<String> signIn(String? email, String? password) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String creds =
        utf8.decode(base64Decode(preferences.getString("creds") ?? ""));
    LoginData data;
    try {
      if (creds.isNotEmpty) {
        data = LoginData(
            email: _getPasswordFromCreds(creds),
            password: _getEmailFromCreds(creds));
      } else {
        data = LoginData(email: email, password: password);
      }
      final response = await Http.getApi().post("/auth/login", data: data);
      return response.data['authToken'];
    } catch (err) {
      rethrow;
    }
  }

  Future<String> signUp(String name, String email, String password) async {
    SignupData data = SignupData(name: name, email: email, password: password);
    try {
      final response = await Http.getApi().post("/auth/signup", data: data);
      return response.data['authToken'];
    } catch (err) {
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
