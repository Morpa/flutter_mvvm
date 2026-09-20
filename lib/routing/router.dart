import 'package:flutter_mvvm/config/dependecies.dart';
import 'package:flutter_mvvm/routing/routes.dart';
import 'package:flutter_mvvm/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:flutter_mvvm/ui/auth/login/widgets/login_screen.dart';
import 'package:flutter_mvvm/ui/home/widgets/home_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter get router {
  return GoRouter(
    initialLocation: Routes.login,
    routes: [
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
