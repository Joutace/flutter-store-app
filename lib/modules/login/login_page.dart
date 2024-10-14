import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challange/di/app_providers.dart';
import 'package:flutter_challange/modules/login/login_states.dart';
import 'package:flutter_challange/shared/resources/app_images.dart';
import 'package:flutter_challange/shared/routes/app_routes.dart';
import 'package:flutter_challange/shared/themes/app_colors.dart';
import 'package:flutter_challange/shared/widgets/app_bottom_sheet.dart';
import 'package:flutter_challange/shared/widgets/app_buttons.dart';
import 'package:flutter_challange/shared/widgets/app_form_field.dart';
import 'package:go_router/go_router.dart';

import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _bloc = getIt.get<LoginBloc>();

  String _email = '';
  String _password = '';

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is LoginErrorState) {
          showErrorAppBottomSheet(context, exception: state.exception);
        } else if (state is LoginSuccessState) {
          GoRouter.of(context).pushReplacement(AppRoutes.home);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        bloc: _bloc,
        builder: (context, state) {
          return Scaffold(
            // isTouchable: state is! LoginLoadingState,
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.backgroundLogin,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.gradient.withOpacity(0.5),
                        AppColors.gradient.withOpacity(0.8),
                        AppColors.gradient.withOpacity(0.9),
                        AppColors.gradient,
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 82,
                            child: Image.asset(AppImages.loginLogo),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: LoginFormField(
                              onChanged: (value) => _email = value,
                              hintText: "Email",
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32),
                            child: LoginFormField(
                              onChanged: (value) => _password = value,
                              hintText: 'Password',
                              isPassword: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: AppButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                _bloc.doLogin(
                                    email: _email, password: _password);
                              },
                              label: 'Login',
                              isLoading: state is LoginLoadingState,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
