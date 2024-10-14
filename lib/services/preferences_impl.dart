import 'dart:convert';

import 'package:flutter_challange/domain/models/user.dart';
import 'package:flutter_challange/services/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesImpl implements Preferences {
  final SharedPreferences sharedPreferences;

  static const String userKey = 'user';

  PreferencesImpl({required this.sharedPreferences});

  @override
  User? getUser() {
    final json = sharedPreferences.get(userKey) as String?;
    if (json != null) {
      return User.fromJson(jsonDecode(json) as Map<String, dynamic>);
    }
    return null;
  }

  @override
  saveUser(User user) {
    sharedPreferences.setString(userKey, jsonEncode(user.toJson()));
  }

  @override
  Future<void> clear() {
    return sharedPreferences.clear();
  }
}
