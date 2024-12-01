import 'package:flutter_challange/domain/models/login.dart';
import 'package:flutter_challange/domain/models/user.dart';

abstract class AuthRepository {
  Future<void> doLogin({required email, required password});

  Future<void> authenticate({required User userData});

  Future<void> logoff();

  Future<Login> doLoginWithGoogle();
}
