part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class AddComment extends CommentEvent {
  final String token;
  final int id;
  final String content;

  AddComment({
    required this.token,
    required this.id,
    required this.content,
  });
}

class DeleteComment extends CommentEvent {
  final String token;
  final int id;

  DeleteComment({
    required this.token,
    required this.id,
  });
}

class ModifyComment extends CommentEvent {
  final String token;
  final int id;
  final String content;

  ModifyComment({
    required this.token,
    required this.id,
    required this.content,
  });
}
