import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/presentation/manger/details_ move_cubit/movie_details_cubit.dart';
import '../../features/home/presentation/manger/more_like_this_cubit/more_like_this_cubit.dart';
import '../../features/home/presentation/manger/popular_move_cubit/popular_movies_cubit.dart';
import '../../features/home/presentation/manger/recommended_move_cubit/recommend_movies_cubit.dart';
import '../../features/home/presentation/manger/up_coming_move_cubit/up_coming_movie_cubit.dart';
import '../../features/search/data/repo/search_repo.dart';
import '../../features/search/data/repo/search_repo_impl.dart';
import '../../features/search/presentation/manger/search_cubit.dart';
import '../../features/watched_list/presentation/manager/togel_movie_cubit.dart';
import '../services/api_service.dart';
import '../services/dio_consumer.dart';
import '../services/dio_operations.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // dio
  getIt.registerSingleton<Dio>(dioInit()); //return Dio obj

  // services

  getIt.registerSingleton<ApiServices>(DioConsumer(
    getIt(),
  ));

  // repos

  getIt.registerSingleton<HomeRepo>(HomeRepoImplementation(
    getIt(),
  ));

  getIt.registerSingleton<SearchRepo>(SearchRepoImplementation(
    getIt(),
  ));

  //cubits

  getIt.registerSingleton<GetUpComingMovieCubit>(GetUpComingMovieCubit(
    getIt(),
  ));

  getIt.registerSingleton<GetRecommendMoviesCubit>(
    GetRecommendMoviesCubit(getIt()),
  );

  getIt.registerSingleton<GetPopularMoviesCubit>(GetPopularMoviesCubit(
    getIt(),
  ));

  getIt.registerSingleton<MovieDetailsCubit>(MovieDetailsCubit(
    getIt(),
  ));

  getIt.registerSingleton<MoreLikeThisCubit>(MoreLikeThisCubit(
    getIt(),
  ));

  getIt.registerSingleton<ToggleMovieCubit>(
    ToggleMovieCubit(),
  );
  getIt.registerSingleton<SearchMovieCubit>(
    SearchMovieCubit(getIt()),
  );
}
