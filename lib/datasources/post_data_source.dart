import '../http/http_utils.dart';
import '../models/page.dart';
import '../models/post.dart';

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
}
