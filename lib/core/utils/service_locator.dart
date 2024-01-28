import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org',
        connectTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    ),
  );

  getIt<Dio>().interceptors.add(
        LogInterceptor(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          logPrint: (Object object) {
            debugPrint(object.toString());
          },
        ),
      );

  getIt<Dio>().interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) => options.queryParameters
            .addAll({'api_key': '79c05e937131679e01142ef81e800843'}),
        //.addAll({'api_key': '79c05e937131679e01142ef81e800843'}),
      ));

  getIt.registerSingleton<ApiServices>(ApiServices(
    getIt(),
  ));

  getIt.registerSingleton<HomeRepo>(HomeRepoImplementation(
    getIt(),
  ));

  //cubits

  getIt.registerSingleton<GetUpComingMovieCubit>(GetUpComingMovieCubit(
    getIt(),
  ));

  getIt.registerSingleton<GetRecommendMoviesCubit>(GetRecommendMoviesCubit());

  getIt.registerSingleton<GetPopularMoviesCubit>(GetPopularMoviesCubit(
    getIt(),
  ));

  getIt.registerSingleton<ToggleMovieCubit>(
    ToggleMovieCubit(),
  );
}
