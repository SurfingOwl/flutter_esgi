import 'package:flutter_esgi/http/http_utils.dart';
import 'package:flutter_esgi/models/user.dart';

class UserDataSource {
  Future<User> getUserRecord(int id) async {
    try {
      final response = await Http.getApi().get("/user/$id");
      return User.fromJson(response.data as Map<String, dynamic>);
    } catch (err) {
      rethrow;
    }
  }
}
