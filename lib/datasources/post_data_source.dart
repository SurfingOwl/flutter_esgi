import 'dart:convert';
import 'dart:io';

import 'package:flutter_esgi/http/http_utils.dart';
import 'package:flutter_esgi/models/page.dart';
import 'package:flutter_esgi/models/post.dart';

class PostDataSource {
  Future<Page> getUserPosts(int id, int page, int size) async {
    try {
      final response =
          await Http.getApi().get("/user/$id/posts", queryParameters: {
        "page": page,
        "per_page": size,
      });
      return Page.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<Page> getAllPosts(int page, int size) async {
    try {
      final response = await Http.getApi().get("/post", queryParameters: {
        "page": page,
        "per_page": size,
      });
      return Page.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<Post> getPostById(int id) async {
    try {
      final response = await Http.getApi().get("/post/$id");
      return Post.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<void> addPost(String token, String content, String? imagePath) async {
    String? base64Image;
    if (imagePath != null) {
      base64Image = base64Encode(await File(imagePath).readAsBytes());
    }
    PostRequest addPostRequest =
        PostRequest(content: content, base_64_image: base64Image);
    try {
      await Http.getApiWithToken(token).post("/post", data: addPostRequest);
    } catch (err) {
      rethrow;
    }
  }

  Future<void> deletePoste(String token, int id) async {
    try {
      await Http.getApiWithToken(token).delete("/poste/$id");
    } catch (err) {
      rethrow;
    }
  }

  Future<Post> modifyPost(
      String token, int id, String content, String? imagePath) async {
    String? base64Image;
    if (imagePath != null) {
      base64Image = base64Encode(await File(imagePath).readAsBytes());
    }
    PostRequest addPostRequest =
        PostRequest(content: content, base_64_image: base64Image);
    try {
      final response = await Http.getApiWithToken(token)
          .patch("/post/$id", data: addPostRequest);
      return Post.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
