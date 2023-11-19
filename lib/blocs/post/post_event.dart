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
