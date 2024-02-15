part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetUserRecord extends UserEvent {
  final int id;

  GetUserRecord({
    required this.id,
  });
}
