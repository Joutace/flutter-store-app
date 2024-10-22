import 'package:flutter_challange/domain/models/user.dart';

abstract class UserService {
  setUser(User user);

  bool isAuthenticated();

  User getUser();
}
