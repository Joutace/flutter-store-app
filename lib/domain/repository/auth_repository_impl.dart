import 'dart:async';
import 'dart:convert';

import 'package:flutter_challange/di/app_providers.dart';
import 'package:flutter_challange/domain/models/login.dart';
import 'package:flutter_challange/domain/models/user.dart';
import 'package:flutter_challange/domain/repository/auth_repository_model.dart';
import 'package:flutter_challange/services/networking_engine.dart';
import 'package:flutter_challange/services/preferences.dart';
import 'package:flutter_challange/services/user_service.dart';
import 'package:flutter_challange/shared/Environment.dart';
import 'package:flutter_challange/shared/widgets/app_exception.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthRepositoryImpl implements AuthRepository {
  final env = getIt.get<Environment>();

  final NetworkingEngine networking;
  final UserService userService;
  final Preferences prefs;

  AuthRepositoryImpl({
    required this.networking,
    required this.userService,
    required this.prefs,
  });

  static const _loginUrl = '/login', _userUrl = '/user/2';

  @override
  Future<dynamic> doLogin({required email, required password}) async {
    try {
      final body = {"email": email, "password": password};
      await networking.post(url: _loginUrl, body: body);

      final user = await fetchMockedUser();
      authenticate(userData: user);
      return user;
    } catch (e) {
      throw AppException(e);
    }
  }

  @override
  Future<void> authenticate({required User userData}) async {
    prefs.saveUser(userData);
    userService.setUser(userData);
  }

  @override
  Future<void> logoff() async {
    await prefs.clear();
  }
}

Future<User> fetchMockedUser() async {
  final jsonResponse = {
    "id": 2,
    "email": "janet.weaver@reqres.in",
    "year": "1980",
    "name": "Weaver",
    "first_name": "Janet",
    "last_name": "Weaver",
    "color": "#f5eb64",
    "pantone_value": "20-4973",
    "avatar": "https://reqres.in/img/faces/2-image.jpg"
  };

  return User.fromJson(jsonResponse);
}
