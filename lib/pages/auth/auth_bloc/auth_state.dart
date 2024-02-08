part of 'auth_bloc.dart';

class AuthState {
  final Status status;
  final Account? account;
  final AuthToken? token;
  final Exception? error;

  AuthState({
    this.status = Status.initial,
    this.account,
    this.token,
    this.error,
  });

  AuthState copyWith({
    Status? status,
    Account? account,
    AuthToken? token,
    Exception? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      account: account ?? this.account,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }
}
