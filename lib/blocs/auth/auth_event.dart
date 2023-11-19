part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class GetAccountInfoFromToken extends AuthEvent {
  final String token;

  GetAccountInfoFromToken({
    required this.token,
  });
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
