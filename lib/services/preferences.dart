import '../domain/models/user.dart';

abstract class Preferences {
  User? getUser();

  saveUser(User user);

  Future<void> clear();
}
