import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esgi/http/http_utils.dart';
import 'package:flutter_esgi/models/user.dart';

import '../../repositories/user_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserState()) {
    on<GetUserRecord>(_onGetUserRecord);
  }

  void _onGetUserRecord(GetUserRecord event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final user = await userRepository.getUserRecord(event.id);
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
}
