import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challange/di/app_providers.dart';
import 'package:flutter_challange/services/user_service.dart';
import 'package:flutter_challange/shared/resources/app_images.dart';
import 'package:flutter_challange/shared/routes/app_routes.dart';
import 'package:flutter_challange/shared/themes/app_colors.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _userService = getIt.get<UserService>();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        if (mounted) {
          _userService.isAuthenticated()
              ? GoRouter.of(context).pushReplacement(AppRoutes.home)
              : GoRouter.of(context).pushReplacement(AppRoutes.login);
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary, // status bar color
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(48),
        child: Center(
          child: Image.asset(AppImages.loginLogo),
        ),
      ),
    );
  }
}
