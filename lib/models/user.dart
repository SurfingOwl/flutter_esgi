class User {
  final int? id;
  final DateTime? createdAt;
  final String? name;
  final String? email;

  const User({
    this.id,
    this.createdAt,
    this.name,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class UserLoginData {
  final String? email;
  final String? password;

  UserLoginData({this.email, this.password});
}
