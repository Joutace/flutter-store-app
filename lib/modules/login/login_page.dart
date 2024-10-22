import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challange/di/app_providers.dart';
import 'package:flutter_challange/modules/login/login_states.dart';
import 'package:flutter_challange/shared/resources/app_images.dart';
import 'package:flutter_challange/shared/routes/app_routes.dart';
import 'package:flutter_challange/shared/themes/app_colors.dart';
import 'package:flutter_challange/shared/themes/app_text_styles.dart';
import 'package:flutter_challange/shared/widgets/app_bottom_sheet.dart';
import 'package:flutter_challange/shared/widgets/app_buttons.dart';
import 'package:flutter_challange/shared/widgets/app_form_field.dart';
import 'package:flutter_challange/shared/widgets/app_scaffold.dart';
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
    final size = MediaQuery.of(context).size;
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
          return AppScaffold(
            isTouchable: state is! LoginLoadingState,
            body: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 768) {
                  return Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.backgroundLogin),
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
                      Center(
                        child: _buildLoginForm(state, size),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Stack(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImages.backgroundLogin),
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
                            Center(
                              child: SizedBox(
                                height: 82,
                                child: Image.asset(AppImages.loginLogo),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Entrar',
                                  style: AppTextStyles.h3.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.black),
                                ),
                              ),
                              _buildLoginForm(state, size),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoginForm(LoginState state, size) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            size.width < 768
                ? SizedBox(
                    height: 82,
                    child: Image.asset(AppImages.loginLogo),
                  )
                : SizedBox(),
            const SizedBox(height: 40),
            LoginFormField(
              onChanged: (value) => _email = value,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 32),
            LoginFormField(
              onChanged: (value) => _password = value,
              hintText: 'Password',
              isPassword: true,
            ),
            const SizedBox(height: 40),
            AppButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                _bloc.doLogin(email: _email, password: _password);
              },
              label: 'Login',
              isLoading: state is LoginLoadingState,
            ),
          ],
        ),
      ),
    );
  }
}
