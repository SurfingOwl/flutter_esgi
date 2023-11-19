class Account {
  final int? id;
  final DateTime? createdAt;
  final String? name;
  final String? email;

  const Account({
    this.id,
    this.createdAt,
    this.name,
    this.email,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class LoginData {
  final String? email;
  final String? password;

  LoginData({
    this.email,
    this.password,
  });
}

class SignupData {
  final String name;
  final String email;
  final String password;

  SignupData({
    required this.name,
    required this.email,
    required this.password,
  });
}
