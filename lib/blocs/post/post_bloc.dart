import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esgi/http/http_utils.dart';
import 'package:flutter_esgi/models/page.dart' as pagination;
import 'package:flutter_esgi/models/post.dart';
import 'package:flutter_esgi/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostState()) {
    on<GetUserPosts>(_onGetUserPosts);
    on<GetAllPosts>(_onGetAllPosts);
    on<GetPostById>(_onGetPostById);
    on<AddPost>(_onAddPost);
    on<DeletePost>(_onDeletePost);
    on<ModifyPost>(_onModifyPost);
  }

  void _onGetUserPosts(GetUserPosts event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final pagination.Page posts =
          await postRepository.getUserPosts(event.id, event.page, event.size);
      emit(state.copyWith(
        status: Status.success,
        posts: posts,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: Status.error,
          error: Exception(),
        ),
      );
    }
  }

  void _onGetAllPosts(GetAllPosts event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final pagination.Page posts =
          await postRepository.getAllPosts(event.page, event.size);
      emit(state.copyWith(
        status: Status.success,
        posts: posts,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: Status.error,
          error: Exception(),
        ),
      );
    }
  }

  void _onGetPostById(GetPostById event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final Post post = await postRepository.getPostById(event.id);
      emit(state.copyWith(
        status: Status.success,
        post: post,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: Status.error,
          error: Exception(),
        ),
      );
    }
  }

  FutureOr<void> _onAddPost(AddPost event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await postRepository.addPoste(
          event.token, event.content, event.imagePath);
      emit(state.copyWith(
        status: Status.success,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: Status.error,
          error: Exception(),
        ),
      );
    }
  }

  FutureOr<void> _onDeletePost(
      DeletePost event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await postRepository.deletePoste(event.token, event.id);
      emit(state.copyWith(
        status: Status.success,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: Status.error,
          error: Exception(),
        ),
      );
    }
  }

  FutureOr<void> _onModifyPost(
      ModifyPost event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final post = await postRepository.modifyPost(
          event.token, event.id, event.content, event.imagePath);
      emit(state.copyWith(
        status: Status.success,
        post: post,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: Status.error,
          error: Exception(),
        ),
      );
    }
  }
}
