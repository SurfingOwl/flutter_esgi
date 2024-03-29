import 'package:flutter_esgi/models/comment.dart';
import 'package:flutter_esgi/models/image.dart';
import 'package:flutter_esgi/models/user.dart';

class Post {
  final int id;
  final int createdAt;
  final String content;
  final PostImage? image;
  final User author;
  final List<Comment>? comments;
  final int? commentsCount;

  Post({
    required this.id,
    required this.createdAt,
    required this.content,
    required this.author,
    this.image,
    this.comments,
    this.commentsCount,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      createdAt: json['created_at'],
      content: json['content'],
      image: json['image'] != null ? PostImage.fromJson(json['image']) : null,
      author: User.fromJson(json['author']),
      comments: json['comments'] != null ? Comment.mapFromJson(json['comments']) : null,
      commentsCount: json['comments_count'],
    );
  }

  static List<Post> mapPostList(List<dynamic> json) {
    return json.map((e) {
      return Post.fromJson(e);
    }).toList();
  }
}

class PostRequestWithoutImage {
  final String content;

  PostRequestWithoutImage({
    required this.content,
  });

  Map<String, dynamic> toJson() => {
    'content': content,
  };
}
