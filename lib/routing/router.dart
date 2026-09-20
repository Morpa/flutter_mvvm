import 'package:flutter/material.dart';
import 'package:flutter_mvvm/config/dependecies.dart';
import 'package:flutter_mvvm/data/repositories/auth/auth_repository.dart';
import 'package:flutter_mvvm/routing/routes.dart';
import 'package:flutter_mvvm/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:flutter_mvvm/ui/auth/login/widgets/login_screen.dart';
import 'package:flutter_mvvm/ui/home/widgets/home_screen.dart';
import 'package:flutter_mvvm/ui/splash/widgets/splash_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter get router {
  return GoRouter(
    initialLocation: Routes.splash,
    refreshListenable: getIt<AuthRepository>(),
    redirect: _redirect,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => SplashScreen(authRepository: getIt()),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => LoginScreen(
          loginViewmodel: LoginViewmodel(authRepository: getIt()),
        ),
      ),
      GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
    ],
  );
}

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final loggedIn = await getIt<AuthRepository>().isAuthenticated;
  if (!loggedIn) return Routes.login;
  final isLoggedIn =
      state.matchedLocation == Routes.splash ||
      state.matchedLocation == Routes.login;
  if (isLoggedIn) return Routes.home;
  return null;
}
