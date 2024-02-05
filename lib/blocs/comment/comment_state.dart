part of 'comment_bloc.dart';

class CommentState {
  final Status status;
  final Comment? comment;
  final Exception? error;

  CommentState({
    this.status = Status.initial,
    this.comment,
    this.error,
  });

  CommentState copyWith({
    Status? status,
    Comment? comment,
    Exception? error,
  }) {
    return CommentState(
      status: status ?? this.status,
      comment: comment ?? this.comment,
      error: error ?? this.error,
    );
  }
}
