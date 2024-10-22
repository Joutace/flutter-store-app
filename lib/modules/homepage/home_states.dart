import 'package:flutter_challange/domain/models/user.dart';

abstract class HomeState {
  late User user;
}

class InitializingHomeState implements HomeState {
  @override
  User user;
  @override
  InitializingHomeState({
    required this.user,
  });
}

class SuccessHomeState implements HomeState {
  @override
  User user;
  @override
  SuccessHomeState({
    required this.user,
  });
}
