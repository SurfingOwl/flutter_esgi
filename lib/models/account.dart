class Account {
  final int? id;
  // final DateTime? createdAt;
  final String? name;
  final String? email;

  const Account({
    this.id,
    // this.createdAt,
    this.name,
    this.email,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      // createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at']),
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

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}

class AuthToken {
  final String? authToken;
  final Account? user;

  AuthToken({this.authToken, this.user});

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      authToken: json['authToken'],
      user: Account.fromJson(json['user'])
    );
  }
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

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
  };
}
