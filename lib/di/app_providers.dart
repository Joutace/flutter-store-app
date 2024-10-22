import 'package:flutter_challange/domain/repository/auth_repository_impl.dart';
import 'package:flutter_challange/domain/repository/auth_repository_model.dart';
import 'package:flutter_challange/modules/homepage/home_bloc.dart';
import 'package:flutter_challange/modules/login/login_bloc.dart';
import 'package:flutter_challange/modules/user_drawer/user_drawer_bloc.dart';
import 'package:flutter_challange/services/networking_engine.dart';
import 'package:flutter_challange/services/networking_engine_impl.dart';
import 'package:flutter_challange/services/preferences.dart';
import 'package:flutter_challange/services/preferences_impl.dart';
import 'package:flutter_challange/services/user_service.dart';
import 'package:flutter_challange/services/user_service_impl.dart';
import 'package:flutter_challange/shared/Environment.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProviders {
  Future init() async {
    getIt.registerSingleton(Environment());

    await _services();

    _blocs();
    _repositories();
    _networking();
  }

  void _blocs() {
    getIt.registerFactory(() => LoginBloc(
          repository: getIt.get<AuthRepository>(),
        ));
    getIt.registerFactory(() => HomeBloc(
          userService: getIt.get(),
        ));

    getIt.registerFactory(() => UserDrawerBloc(
          authRepository: getIt.get<AuthRepository>(),
          userService: getIt.get<UserService>(),
        ));
  }

  void _repositories() {
    getIt.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
        networking: getIt.get<NetworkingEngine>(),
        prefs: getIt.get<Preferences>(),
        userService: getIt.get<UserService>()));
  }

  void _networking() {
    getIt.registerFactory<NetworkingEngine>(() => NetworkingEngineImpl());
  }

  Future _services() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<Preferences>(
        () => PreferencesImpl(sharedPreferences: sharedPreferences));
    getIt.registerLazySingleton<UserService>(() => UserServiceImpl(
          prefs: getIt<Preferences>(),
        ));
  }
}

final getIt = GetIt.instance;
