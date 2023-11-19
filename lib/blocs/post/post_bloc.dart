import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esgi/http/http_utils.dart';
import 'package:flutter_esgi/models/page.dart' as pagination;
import 'package:flutter_esgi/models/post.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostState()) {
    on<GetUserPosts>(_onGetUserPosts);
    on<GetAllPosts>(_onGetAllPosts);
    on<GetPostById>(_onGetPostById);
  }

  void _onGetUserPosts(GetUserPosts event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final pagination.Page posts =
      await getUserPosts(event.id, event.page, event.size);
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

  Future<pagination.Page> getUserPosts(int id, int page, int size) async {
    try {
      final response =
      await Http.getApi().get("/user/$id/posts", queryParameters: {
        "page": page,
        "per_page": size,
      });
      return pagination.Page.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  void _onGetAllPosts(GetAllPosts event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final pagination.Page posts = await getAllPosts(event.page, event.size);
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

  Future<pagination.Page> getAllPosts(int page, int size) async {
    try {
      final response = await Http.getApi().get("/post", queryParameters: {
        "page": page,
        "per_page": size,
      });
      return pagination.Page.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  void _onGetPostById(GetPostById event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final Post post = await getPostById(event.id);
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

  Future<Post> getPostById(int id) async {
    try {
      final response = await Http.getApi().get("/post/$id");
      return Post.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
