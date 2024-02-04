import 'package:flutter_esgi/datasources/comment_data_source.dart';
import 'package:flutter_esgi/models/comment.dart';

class CommentRepository {
  final CommentDataSource commentDataSource;

  CommentRepository({required this.commentDataSource});

  Future<Comment> addComment(String token, int id, String content) async {
    return commentDataSource.addComment(token, id, content);
  }

  Future<void> deleteComment(String token, int id) async {
    return commentDataSource.deleteComment(token, id);
  }

  Future<Comment> modifyComment(String token, int id, String content) async {
    return commentDataSource.modifyComment(token, id, content);
  }
}
