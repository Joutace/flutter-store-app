import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challange/domain/repository/auth_repository_model.dart';
import 'package:flutter_challange/modules/login/login_events.dart';
import 'package:flutter_challange/modules/login/login_states.dart';
import 'package:flutter_challange/shared/widgets/app_exception.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc({
    required this.repository,
  }) : super(LoginInitialState()) {
    on<DoLoginEvent>((event, emit) async {
      try {
        emit(LoginLoadingState());

        await repository.doLogin(email: event.email, password: event.password);
        emit(LoginSuccessState());
      } on AppException catch (exception) {
        emit(LoginErrorState(exception: exception));
      }
    });

    on<DoLoginWithGoogleEvent>((event, emit) async {
      try {
        emit(LoginLoadingState());

        await repository.doLoginWithGoogle();

        emit(LoginSuccessState());
      } on AppException catch (exception) {
        emit(LoginErrorState(exception: exception));
      }
    });
  }

  doLogin({required String email, required String password}) {
    add(DoLoginEvent(email: email, password: password));
  }

  doLoginWithGoogle() {
    add(DoLoginWithGoogleEvent());
  }
}
