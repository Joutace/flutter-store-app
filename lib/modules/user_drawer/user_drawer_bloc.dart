import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challange/domain/repository/auth_repository_model.dart';
import 'package:flutter_challange/modules/user_drawer/user_drawer_events.dart';
import 'package:flutter_challange/modules/user_drawer/user_drawer_states.dart';
import 'package:flutter_challange/services/user_service.dart';
import 'package:flutter_challange/shared/widgets/app_exception.dart';

class UserDrawerBloc extends Bloc<UserDrawerEvent, UserDrawerState> {
  final AuthRepository authRepository;
  final UserService userService;

  UserDrawerBloc({
    required this.authRepository,
    required this.userService,
  }) : super(InitialUserDrawerState()) {
    on<InitUserDrawerEvent>((event, emit) async {
      try {
        final user = userService.getUser();

        emit(SuccessUserDrawerState(user));
      } on AppException catch (_) {}
    });

    on<LogoffUserDrawerEvent>((event, emit) async {
      try {
        await authRepository.logoff();
        emit(LogoffUserDrawerState());
      } on AppException catch (_) {}
    });
  }

  void init() {
    add(InitUserDrawerEvent());
  }

  void logoff() {
    add(LogoffUserDrawerEvent());
  }
}
