import 'package:flutter_esgi/models/user.dart';

class Comment {
  final int id;
  final int createdAt;
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
      author: User.fromJson(json['author']),
    );
  }

  static List<Comment> mapFromJson(List<dynamic> json) {
    return json.map((e) {
      return Comment.fromJson(e);
    }).toList();
  }
}

class AddCommentRequest {
  final int post_id;
  final String content;

  AddCommentRequest({
    required this.post_id,
    required this.content,
  });

  Map<String, dynamic> toJson() => {
    'post_id': post_id,
    'content': content,
  };
}

class PatchCommentRequest {
  final String content;

  PatchCommentRequest({
    required this.content,
  });
}
