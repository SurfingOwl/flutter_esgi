part of 'auth_bloc.dart';

class AuthState {
  final Status status;
  final User? user;
  final String? token;
  final Exception? error;

  AuthState({
    this.status = Status.initial,
    this.user,
    this.token,
    this.error,
  });

  AuthState copyWith({
    Status? status,
    User? user,
    String? token,
    Exception? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }
}
