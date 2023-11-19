import 'package:flutter_esgi/models/comment.dart';
import 'package:flutter_esgi/models/image.dart';
import 'package:flutter_esgi/models/user.dart';

class Post {
  final int id;
  final DateTime createdAt;
  final String content;
  final Image? image;
  final User? author;
  final List<Comment>? comments;
  final int? commentsCount;

  Post({
    required this.id,
    required this.createdAt,
    required this.content,
    this.image,
    this.author,
    this.comments,
    this.commentsCount,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      createdAt: json['created_at'],
      content: json['content'],
      image: Image.fromJson(json['image']),
      author: User.fromJson(json['author']),
      comments: Comment.mapFromJson(json['comments']),
      commentsCount: json['comments_count'],
    );
  }

  static List<Post> mapPostList(List<Map<String, dynamic>> json) {
    return json.map((e) {
      return Post.fromJson(e);
    }).toList();
  }
}
