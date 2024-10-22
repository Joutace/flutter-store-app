import 'package:flutter_challange/domain/models/user.dart';

abstract class UserDrawerState {}

class InitialUserDrawerState implements UserDrawerState {}

class SuccessUserDrawerState implements UserDrawerState {
  final User user;

  SuccessUserDrawerState(
    this.user,
  );
}

class LogoffUserDrawerState implements UserDrawerState {}
