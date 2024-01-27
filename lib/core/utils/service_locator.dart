import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/presentation/manger/get_popular_movies_cubit.dart';
import '../../features/home/presentation/manger/get_recommend_movies_cubit.dart';
import '../../features/home/presentation/manger/get_up_coming_movie_cubit.dart';
import '../../features/watched_list/presentation/manager/togel_movie_cubit.dart';
import 'api_service.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ApiServices>(ApiServices(getIt()));

  getIt.registerSingleton<HomeRepo>(HomeRepoImplementation(
    getIt(),
  ));

  //cubits
  getIt
      .registerSingleton<GetUpComingMovieCubit>(GetUpComingMovieCubit(getIt()));

  getIt.registerSingleton<GetRecommendMoviesCubit>(
      GetRecommendMoviesCubit(getIt()));

  getIt
      .registerSingleton<GetPopularMoviesCubit>(GetPopularMoviesCubit(getIt()));

  getIt.registerSingleton<togelMovieCubit>(togelMovieCubit());

  ///
}

//final GetPopularMoviesCubit cubit = getIt();

//final  cubit = getIt<GetPopularMoviesCubit>();
