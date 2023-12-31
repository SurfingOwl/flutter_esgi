import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esgi/http/http_utils.dart';
import 'package:flutter_esgi/models/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<GetAccountInfoFromToken>(_onGetAccountInfoFromToken);
    on<SignIn>(_onSignIn);
    on<SignUp>(_onSignUp);
  }

  void _onGetAccountInfoFromToken(
      GetAccountInfoFromToken event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final account = await getAccountInfoFromToken(event.token);
      emit(state.copyWith(
        status: Status.success,
        account: account,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: Status.error,
          error: Exception(),
        ),
      );
    }
  }

  void _onSignIn(SignIn event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final token = await signIn(event.email, event.password);
      emit(state.copyWith(
        status: Status.success,
        token: token,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: Status.error,
          error: Exception(),
        ),
      );
    }
  }

  void _onSignUp(SignUp event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final token = await signUp(event.name, event.email, event.password);

      if (token.isNotEmpty) {
        await saveCreds(event.email, event.password);
      }

      emit(state.copyWith(
        status: Status.success,
        token: token,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: Status.error,
          error: Exception(),
        ),
      );
    }
  }

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

  Future<bool> saveCreds(String email, String password) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String creds = "$email:$password";
    return preferences.setString("creds", base64Encode(utf8.encode(creds)));
  }
}
