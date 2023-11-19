import 'package:flutter_esgi/models/user.dart';

class Comment {
  final int id;
  final DateTime createdAt;
  final String content;
  final User? author;

  Comment({
    required this.id,
    required this.createdAt,
    required this.content,
    this.author,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      createdAt: json['created_at'],
      content: json['content'],
      author: json['author'],
    );
  }

  static List<Comment> mapFromJson(List<Map<String, dynamic>> json) {
    return json.map((e) {
      return Comment.fromJson(e);
    }).toList();
  }
}
