import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/view/home_screen.dart';
import '../../features/splash/presentation/views/splash_screen.dart';

abstract class Routes {
  static const String splashScreenPath = '/';
  static const String homeViewPath = '/homeView';
  static const String bookDetailsViewPath = '/BookDetailsViewPath';
  static const String searchViewPath = '/SearchView';
}

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.splashScreenPath,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: Routes.homeViewPath,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
    ],
  );
}
