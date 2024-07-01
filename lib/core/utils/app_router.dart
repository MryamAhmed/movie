// import 'package:flutter/cupertino.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../features/home/presentation/view/home_screen.dart';
// import '../../features/home/presentation/view/widget/sections/movie_details/move_details.dart';
// import '../../features/root/widget/bottom_nav.dart';
// import '../../features/splash/presentation/views/splash_screen.dart';
// import 'routes.dart';
//
// abstract class AppRouter {
//   static final GoRouter router = GoRouter(
//     routes: <RouteBase>[
//       GoRoute(
//         path: Routes.splashScreenPath,
//         builder: (BuildContext context, GoRouterState state) {
//           return const SplashScreen();
//         },
//       ),
//       GoRoute(
//         path: Routes.homeViewPath,
//         builder: (BuildContext context, GoRouterState state) {
//           return const HomeView();
//         },
//       ),
//       GoRoute(
//         path: Routes.bookDetailsViewPath,
//         builder: (BuildContext context, GoRouterState state) {
//           return MovieDetails(
//             movieId: int.parse(state.pathParameters['moveId']!),
//           );
//         },
//       ),
//       GoRoute(
//         path: Routes.navBarPath,
//         builder: (BuildContext context, GoRouterState state) {
//           return const NavBar();
//         },
//       ),
//     ],
//   );
// }
