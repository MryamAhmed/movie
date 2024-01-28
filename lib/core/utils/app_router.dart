import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/features/home/presentation/view/home_screen.dart';

import '../../features/splash/presentation/views/splash_screen.dart';

abstract class AppRouter {
  static String homeViewPath = '/homeView';
  static String bookDetailsViewPath = '/BookDetailsViewPath';
  static String searchViewPath = '/SearchView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: homeViewPath,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
    ],
  );
}
