import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
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
  
  Future<void> addPostWithImage(String token, String content, String imagePath) async {
    try {
      await Http.getApiWithToken(token)
          .post("/post", data: await formDataFromImagePath(content, imagePath));
    } catch (err) {
      log(err.toString());
      rethrow;
    }
  }

  Future<void> addPostWithoutImage(String token, String content) async {
    try {
      await Http.getApiWithToken(token)
          .post("/post", data: jsonEncode(PostRequestWithoutImage(content: content)));
    } catch (err) {
      log(err.toString());
      rethrow;
    }
  }

  Future<FormData> formDataFromImagePath(
      String content, String imagePath) async {{
      String? fileName = imagePath.split('/').last;
      FormData formData = FormData.fromMap({
        "base_64_image":
            await MultipartFile.fromFile(imagePath, filename: fileName),
        "content": content
      });
      return formData;
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
    PostRequestWithoutImage addPostRequest =
        PostRequestWithoutImage(content: content);
    try {
      final response = await Http.getApiWithToken(token)
          .patch("/post/$id", data: addPostRequest);
      return Post.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
