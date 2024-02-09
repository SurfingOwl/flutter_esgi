part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class GetUserPosts extends PostEvent {
  final int id;
  final int page;
  final int size;

  GetUserPosts({
    required this.id,
    required this.page,
    required this.size,
  });
}

class GetAllPosts extends PostEvent {
  final int page;
  final int size;

  GetAllPosts({
    required this.page,
    required this.size,
  });
}

class GetPostById extends PostEvent {
  final int id;

  GetPostById({
    required this.id,
  });
}

class AddPost extends PostEvent {
  final String token;
  final String content;
  final String? imagePath;

  AddPost({
    required this.token,
    required this.content,
    this.imagePath,
  });
}

class DeletePost extends PostEvent {
  final String token;
  final int id;

  DeletePost({
    required this.token,
    required this.id,
  });
}

class ModifyPost extends PostEvent {
  final String token;
  final int id;
  final String content;
  final String? imagePath;

  ModifyPost({
    required this.token,
    required this.id,
    required this.content,
    this.imagePath,
  });
}
