part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class GetUserInfoFromToken extends AuthEvent {
  final String token;

  GetUserInfoFromToken({required this.token});
}

class SignIn extends AuthEvent {
  final String? email;
  final String? password;

  SignIn({
    this.email,
    this.password,
  });
}

class SignUp extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUp({
    required this.name,
    required this.email,
    required this.password,
  });
}
