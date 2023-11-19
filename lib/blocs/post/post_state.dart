part of 'post_bloc.dart';

class PostState {
  final Status status;
  final Post? post;
  final pagination.Page? posts;
  final Exception? error;

  PostState({
    this.status = Status.initial,
    this.post,
    this.posts,
    this.error,
  });

  PostState copyWith({
    Status? status,
    Post? post,
    pagination.Page? posts,
    Exception? error,
  }) {
    return PostState(
      status: status ?? this.status,
      post: post ?? this.post,
      posts: posts ?? this.posts,
      error: error ?? this.error,
    );
  }
}
