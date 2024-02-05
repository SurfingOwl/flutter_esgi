import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esgi/http/http_utils.dart';
import 'package:flutter_esgi/models/comment.dart';
import 'package:flutter_esgi/repositories/comment_repository.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository commentRepository;

  CommentBloc({required this.commentRepository}) : super(CommentState()) {
    on<AddComment>(_onAddComment);
    on<DeleteComment>(_onDeleteComment);
    on<ModifyComment>(_onModifyComment);
  }

  FutureOr<void> _onAddComment(
      AddComment event, Emitter<CommentState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final comment = await commentRepository.addComment(
          event.token, event.id, event.content);
      emit(state.copyWith(
        status: Status.success,
        comment: comment,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: Status.error,
        error: Exception(),
      ));
    }
  }

  FutureOr<void> _onDeleteComment(
      DeleteComment event, Emitter<CommentState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await commentRepository.deleteComment(event.token, event.id);
      emit(state.copyWith(
        status: Status.success,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: Status.error,
        error: Exception(),
      ));
    }
  }

  FutureOr<void> _onModifyComment(
      ModifyComment event, Emitter<CommentState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final comment = await commentRepository.modifyComment(
          event.token, event.id, event.content);
      emit(state.copyWith(
        status: Status.success,
        comment: comment,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: Status.error,
        error: Exception(),
      ));
    }
  }
}
