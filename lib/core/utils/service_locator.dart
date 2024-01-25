import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/data/repo/home_repo_imple.dart';
import '../../features/home/presentation/manger/get_popular_movies_cubit.dart';
import '../../features/home/presentation/manger/get_recommende_movies_cubit.dart';
import '../../features/home/presentation/manger/get_up_comming_movie_cubit.dart';
import '../../features/watched_list/presenttion/manager/togel_movie_cubit.dart';
import 'api_service.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ApiServices>(ApiServices(getIt()));

  getIt.registerSingleton<HomeRepo>(HomeRepoImplementation(
    getIt<ApiServices>(),
  ));

  //cubits
  getIt.registerSingleton<GetUpCommingMovieCubit>(
      GetUpCommingMovieCubit(getIt()));

  getIt.registerSingleton<GetRecommendeMoviesCubit>(
      GetRecommendeMoviesCubit(getIt()));

  getIt
      .registerSingleton<GetPopularMoviesCubit>(GetPopularMoviesCubit(getIt()));

  getIt.registerSingleton<TogelMovieCubit>(TogelMovieCubit());

  ///
}

//final GetPopularMoviesCubit cubit = getIt();

//final  cubit = getIt<GetPopularMoviesCubit>();
