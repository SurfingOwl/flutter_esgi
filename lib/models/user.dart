class User {
  final int? id;
  final String? name;
  final DateTime? createdAt;

  User({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
    );
  }
}
