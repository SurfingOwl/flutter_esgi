part of 'user_bloc.dart';

class UserState {
  final Status status;
  final User? user;
  final Exception? error;

  UserState({
    this.status = Status.initial,
    this.user,
    this.error,
  });

  UserState copyWith({
    Status? status,
    User? user,
    Exception? error,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}
