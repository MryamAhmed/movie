import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../models/movie_details_model.dart';
import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<String, List<MovieDetailsModel>>> getPopularMovies() async {
    try {
      var data = await apiService.get(endPoint: '/3/movie/popular');

      List<MovieDetailsModel> movesList = [];

      for (var item in data['results']) {
        movesList.add(MovieDetailsModel.fromJson(item));
      }
      return right(movesList);
    } on ServerFailure catch (e) {
      return left(e.errMessage);
    }
  }

  @override
  Future<Either<String, List<MovieDetailsModel>>> getUpComingMovies() async {
    try {
      var data = await apiService.get(endPoint: '/3/movie/upcoming');

      List<MovieDetailsModel> movesList = [];

      for (var item in data['results']) {
        movesList.add(MovieDetailsModel.fromJson(item));
      }

      return right(movesList);
    } on ServerFailure catch (e) {
      return left(e.errMessage);
    }
  }

  @override
  Future<Either<String, List<MovieDetailsModel>>> getRecommendedMovies() async {
    try {
      var data = await apiService.get(endPoint: '/3/movie/top_rated');

      List<MovieDetailsModel> movesList = [];

      for (var item in data['results']) {
        movesList.add(MovieDetailsModel.fromJson(item));
      }

      return right(movesList);
    } on ServerFailure catch (e) {
      return left(e.errMessage);
    }
  }

  @override
  Future<Either<String, MovieDetailsModel>> getMovieDetails(num movieId) async {
    try {
      var data = await apiService.get(endPoint: '/3/movie/$movieId');

      MovieDetailsModel movesList; // why not MovieDetailsModel

      movesList = (MovieDetailsModel.fromJson(data));

      return right(movesList);
    } on ServerFailure catch (e) {
      return left(e.errMessage);
    }
  }

  @override
  Future<Either<String, List<MovieDetailsModel>>> getSimilarMovies(
      num movieId) async {
    try {
      var data = await apiService.get(endPoint: '/3/movie/$movieId/similar');

      List<MovieDetailsModel> movesList = [];

      for (var item in data['results']) {
        movesList.add(MovieDetailsModel.fromJson(item));
      }
      return right(movesList);
    } on ServerFailure catch (e) {
      return left(e.errMessage);
    }
  }
}
