import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esgi/http/http_utils.dart';
import 'package:flutter_esgi/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {
    on<GetUserRecord>(_onGetUserRecord);
  }

  void _onGetUserRecord(GetUserRecord event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final user = await getUserRecord(event.id);
      emit(state.copyWith(
        status: Status.success,
        user: user,
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

  Future<User> getUserRecord(int id) async {
    try {
      final response = await Http.getApi().get("/user/$id");
      return User.fromJson(response.data as Map<String, dynamic>);
    } catch (err) {
      rethrow;
    }
  }
}
