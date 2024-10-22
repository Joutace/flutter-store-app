import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challange/modules/homepage/home_events.dart';
import 'package:flutter_challange/modules/homepage/home_states.dart';
import 'package:flutter_challange/services/user_service.dart';
import 'package:flutter_challange/shared/widgets/app_exception.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserService userService;

  HomeBloc({
    required this.userService,
  }) : super(InitializingHomeState(
          user: userService.getUser(),
        )) {
    on<InitHomeEvent>((event, emit) async {
      try {
        emit(SuccessHomeState(
          user: userService.getUser(),
        ));
      } on AppException {
        // unused
      }
    });
  }

  init() {
    add(InitHomeEvent());
  }
}
