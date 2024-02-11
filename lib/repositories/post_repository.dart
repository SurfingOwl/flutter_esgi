import 'package:flutter_esgi/datasources/post_data_source.dart';
import 'package:flutter_esgi/models/page.dart';
import 'package:flutter_esgi/models/post.dart';

class PostRepository {
  final PostDataSource postDataSource;

  PostRepository({required this.postDataSource});

  Future<Page> getUserPosts(int id, int page, int size) async {
    return postDataSource.getUserPosts(id, page, size);
  }

  Future<Page> getAllPosts(int page, int size) async {
    return postDataSource.getAllPosts(page, size);
  }

  Future<Post> getPostById(int id) async {
    return postDataSource.getPostById(id);
  }

  Future<void> addPostWithoutImage(String token, String content) {
    return postDataSource.addPostWithoutImage(token, content);
  }

  Future<void> addPostWithImage(String token, String content, String imagePath) {
    return postDataSource.addPostWithImage(token, content, imagePath);
  }

  Future<void> deletePoste(String token, int id) {
    return postDataSource.deletePoste(token, id);
  }

  Future<Post> modifyPost(
      String token, int id, String content, String? imagePath) {
    return postDataSource.modifyPost(token, id, content, imagePath);
  }
}
