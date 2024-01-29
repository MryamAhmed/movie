import 'package:dartz/dartz.dart';

import '../../../../core/services/api_service.dart';
import '../../../splash/errors/failure.dart';
import '../models/movie_details_model.dart';
import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<MovieDetailsModel>>> getPopularMovies() async {
    try {
      var data = await apiService.get(endPoint: '/3/movie/popular');

      List<MovieDetailsModel> moveiList = [];

      for (var item in data['results']) {
        moveiList.add(MovieDetailsModel.fromJson(item));
      }

      return right(moveiList);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, List<MovieDetailsModel>>> getUpComingMovies() async {
    try {
      var data = await apiService.get(endPoint: '/3/movie/upcoming');

      List<MovieDetailsModel> moveiList = [];

      print('from UpComingMovies repo $data'); //printed

      for (var item in data['results']) {
        moveiList.add(MovieDetailsModel.fromJson(item));
      }

      return right(moveiList);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, List<MovieDetailsModel>>>
      getRecommendedMovies() async {
    try {
      var data = await apiService.get(endPoint: '/3/movie/top_rated');

      print(data); //printed

      List<MovieDetailsModel> moveiList = [];

      print('from Recommended repo $data'); //printed

      for (var item in data['results']) {
        moveiList.add(MovieDetailsModel.fromJson(item));
      }
      print('hi from Recommended after for');

      print('good $moveiList'); //did not print => printed after .data

      return right(moveiList);
    } on ServerFailure catch (e) {
      print(' error ${e.errMessage}');
      return left(e);
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
      num movie_id) async {
    try {
      var data = await apiService.get(endPoint: '/3/movie/${movie_id}');

      print('detaails${data}'); //printed

      MovieDetailsModel moveiList; // why not MovieDetailsModel

      print('from details repo $data'); //printed

      moveiList = (MovieDetailsModel.fromJson(data));

      print('hi from details after for');
      print('det $moveiList'); //did not print => printed after .data

      return right(moveiList);
    } on ServerFailure catch (e) {
      print(' error ${e.errMessage}');
      return left(e);
    }
  }

  @override
  Future<Either<Failure, List<MovieDetailsModel>>> getSimilarMovies(
      num movie_id) async {
    try {
      var data = await apiService.get(endPoint: '/3/movie/${movie_id}/similar');

      print(data); //printed
      // print(responseBody);

      List<MovieDetailsModel> moveiList = [];

      print('from similar repo $data'); //printed

      for (var item in data['results']) {
        moveiList.add(MovieDetailsModel.fromJson(item));
      }
      print('hi from similar after for');

      print('good $moveiList'); //did not print => printed after .data

      return right(moveiList);
    } on ServerFailure catch (e) {
      print(' error ${e.errMessage}');
      return left(e);
    }
  }
}
