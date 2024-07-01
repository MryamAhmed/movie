import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/watched_list/presentation/manager/togel_movie_cubit.dart';

import 'core/utils/service_locator.dart';
import 'features/home/presentation/manger/popular_move_cubit/popular_movies_cubit.dart';
import 'features/home/presentation/manger/recommended_move_cubit/recommend_movies_cubit.dart';
import 'features/home/presentation/manger/up_coming_move_cubit/up_coming_movie_cubit.dart';
import 'features/splash/presentation/views/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                getIt<GetUpComingMovieCubit>()..getUpComingMovies()),
        BlocProvider(
            create: (BuildContext context) =>
                getIt<GetRecommendMoviesCubit>()..getRecommendedMovies()),
        BlocProvider(
            create: (BuildContext context) =>
                getIt<GetPopularMoviesCubit>()..getPopularMovies()),
        BlocProvider(
            create: (BuildContext context) => getIt<ToggleMovieCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData.dark(),
      ),
    );

    BlocProvider(
      create: (BuildContext context) => getIt<ToggleMovieCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
