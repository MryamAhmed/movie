import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../manger/popular_move_cubit/popular_movies_cubit.dart';
import '../manger/recommended_move_cubit/recommend_movies_cubit.dart';
import '../manger/up_coming_move_cubit/up_coming_movie_cubit.dart';
import 'widget/home_screen_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
      ],
      child: const SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
