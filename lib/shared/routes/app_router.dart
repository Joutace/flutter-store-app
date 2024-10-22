import 'package:flutter/cupertino.dart';
import 'package:flutter_challange/modules/homepage/home_page.dart';
import 'package:flutter_challange/modules/login/login_page.dart';
import 'package:flutter_challange/modules/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

CustomTransitionPage leftToRightTransition(GoRouterState state, Widget widget) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: widget,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (_, animation, __, child) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}

CustomTransitionPage bottomToTopTransition(GoRouterState state, Widget widget) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: widget,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (_, animation, __, child) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: <RouteBase>[
    GoRoute(
        path: AppRoutes.splash,
        pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const SplashPage(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            )),
    GoRoute(
      path: AppRoutes.login,
      builder: (_, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.home,
      pageBuilder: (_, state) => leftToRightTransition(state, HomePage(),),
    ),
  ],
);
