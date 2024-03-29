import 'package:flutter_esgi/datasources/auth_data_source.dart';
import 'package:flutter_esgi/models/account.dart';

class AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepository({required this.authDataSource});

  Future<Account> getAccountInfoFromToken(String token) async {
    return authDataSource.getAccountInfoFromToken(token);
  }

  Future<AuthToken> signIn(String? email, String? password) async {
    return authDataSource.signIn(email, password);
  }

    Future<AuthToken> signUp(String name, String email, String password) async {
    return authDataSource.signUp(name, email, password);
  }
}
