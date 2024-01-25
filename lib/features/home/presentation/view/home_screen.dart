import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../manger/get_popular_movies_cubit.dart';
import '../manger/get_recommende_movies_cubit.dart';
import '../manger/get_up_comming_movie_cubit.dart';
import 'widget/home_screen_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                getIt<GetUpCommingMovieCubit>()..getUpComingMovies()),
        BlocProvider(
            create: (BuildContext context) =>
                getIt<GetRecommendeMoviesCubit>()..getRecommendedMovies()),
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
