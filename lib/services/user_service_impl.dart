import 'package:flutter_challange/domain/models/user.dart';
import 'package:flutter_challange/services/preferences.dart';
import 'package:flutter_challange/services/user_service.dart';

class UserServiceImpl implements UserService {
  final Preferences prefs;

  User? _user;

  UserServiceImpl({
    required this.prefs,
  }) {
    final user = prefs.getUser();
    if (user != null) {
      _user = user;
    }
  }

  @override
  bool isAuthenticated() {
    return _user != null;
  }

  @override
  User getUser() {
    return _user!;
  }

  @override
  setUser(User user) {
    _user = user;
  }
}
