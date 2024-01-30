import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/view/home_screen.dart';
import '../../features/search/presentation/view/search_screen.dart';
import '../../features/splash/presentation/views/splash_screen.dart';
import '../../features/watched_list/presentation/view/watched_list.dart';
import 'routes.dart';

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
      // GoRoute(
      //   path: Routes.bookDetailsViewPath,
      //   builder: (BuildContext context, GoRouterState state) {
      //
      //     return MovieDetails(movieId: state.extra,)
      //   },
      // ),

      GoRoute(
        path: Routes.searchViewPath,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchScreen();
        },
      ),

      GoRoute(
        path: Routes.watchedViewPath,
        builder: (BuildContext context, GoRouterState state) {
          return const WatchedList();
        },
      ),
    ],
  );
}
