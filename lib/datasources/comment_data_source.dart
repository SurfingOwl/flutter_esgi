import 'package:flutter_esgi/http/http_utils.dart';
import 'package:flutter_esgi/models/comment.dart';

class CommentDataSource {
  Future<Comment> addComment(String token, int id, String content) async {
    AddCommentRequest commentRequest =
        AddCommentRequest(post_id: id, content: content);

    try {
      final response = await Http.getApiWithToken(token)
          .post("/comment", data: commentRequest);
      return Comment.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<void> deleteComment(String token, int id) async {
    try {
      await Http.getApiWithToken(token).delete("/comment/$id");
    } catch (err) {
      rethrow;
    }
  }

  Future<Comment> modifyComment(String token, int id, String content) async {
    try {
      final response = await Http.getApiWithToken(token)
          .patch("/comment/$id", data: PatchCommentRequest(content: content));
      return Comment.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
