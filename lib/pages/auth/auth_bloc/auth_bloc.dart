import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esgi/http/http_utils.dart';
import 'package:flutter_esgi/models/account.dart';
import 'package:flutter_esgi/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthState()) {
    on<GetAccountInfoFromToken>(_onGetAccountInfoFromToken);
    on<SignIn>(_onSignIn);
    on<SignUp>(_onSignUp);
  }

  void _onGetAccountInfoFromToken(
      GetAccountInfoFromToken event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final account = await authRepository.getAccountInfoFromToken(event.token);
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
      final token = await authRepository.signIn(event.email, event.password);

      emit(state.copyWith(
        status: Status.success,
        token: token,
        isAuthenticated: true,
      ));
    } on Exception catch (err) {
      emit(
        state.copyWith(
          status: Status.error,
          error: err,
          isAuthenticated: false,
        ),
      );
    }
  }

  void _onSignUp(SignUp event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final token =
          await authRepository.signUp(event.name, event.email, event.password);

      // if (token.authToken!.isNotEmpty) {
      //   await saveCreds(event.email, event.password);
      // }

      emit(state.copyWith(
        status: Status.success,
        token: token,
        isAuthenticated: true,
      ));
    } on Exception catch (err) {
      emit(
        state.copyWith(
          status: Status.error,
          error: err,
          isAuthenticated: false,
        ),
      );
    }
  }

  // Future<bool> saveCreds(String email, String password) async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   final String creds = "$email:$password";
  //   return preferences.setString("creds", base64Encode(utf8.encode(creds)));
  // }
}
