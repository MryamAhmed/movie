import 'package:dartz/dartz.dart';

import '../models/movie_details_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<MovieDetailsModel>>> getPopularMovies();

  Future<Either<String, List<MovieDetailsModel>>> getUpComingMovies();

  Future<Either<String, List<MovieDetailsModel>>> getRecommendedMovies();

  Future<Either<String, MovieDetailsModel>> getMovieDetails(num movieId);

  Future<Either<String, List<MovieDetailsModel>>> getSimilarMovies(num movieId);
}
