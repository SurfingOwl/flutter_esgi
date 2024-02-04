import 'package:flutter_esgi/datasources/post_data_source.dart';

import '../models/page.dart';
import '../models/post.dart';

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
}
