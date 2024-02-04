import 'package:flutter_esgi/datasources/user_data_source.dart';

import '../models/user.dart';

class UserRepository {
  final UserDataSource userDataSource;

  UserRepository({required this.userDataSource});

  Future<User> getUserRecord(int id) async {
    return userDataSource.getUserRecord(id);
  }
}
