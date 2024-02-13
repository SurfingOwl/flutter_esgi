part of 'auth_bloc.dart';

class AuthState {
  final Status status;
  final Account? account;
  final AuthToken? token;
  final Exception? error;
  final bool? isAuthenticated;

  AuthState({
    this.status = Status.initial,
    this.account,
    this.token,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    Status? status,
    Account? account,
    AuthToken? token,
    Exception? error,
    isAuthenticated = false,
  }) {

    return AuthState(
      status: status ?? this.status,
      account: account ?? this.account,
      token: token ?? this.token,
      error: error ?? this.error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated
    );
  }
}
