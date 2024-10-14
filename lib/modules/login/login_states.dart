import 'package:flutter_challange/shared/widgets/app_exception.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState implements LoginState {}

class LoginSuccessState implements LoginState {}

class LoginErrorState implements LoginState {
  final AppException exception;

  LoginErrorState({required this.exception});
}
