part of 'post_bloc.dart';

class PostState {
  final Status status;
  final Post? post;
  final List<Post>? posts;
  final pagination.Page? paginationInfo;
  final Exception? error;

  PostState({
    this.status = Status.initial,
    this.post,
    this.posts,
    this.paginationInfo,
    this.error,
  });

  PostState copyWith({
    Status? status,
    Post? post,
    List<Post>? posts,
    pagination.Page? paginationInfo,
    Exception? error,
  }) {
    return PostState(
      status: status ?? this.status,
      post: post ?? this.post,
      posts: posts ?? this.posts,
      paginationInfo: paginationInfo ?? this.paginationInfo,
      error: error ?? this.error,
    );
  }
}
