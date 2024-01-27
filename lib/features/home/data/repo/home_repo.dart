import 'package:dartz/dartz.dart';
import 'package:movies/features/splash/errors/failure.dart';

import '../models/movie_details_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieDetailsModel>>> getPopularMovies();
  Future<Either<Failure, List<MovieDetailsModel>>> getUpComingMovies();
  Future<Either<Failure, List<MovieDetailsModel>>> getRecommendedMovies();

  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(num movie_id);

  Future<Either<Failure, List<MovieDetailsModel>>> getSimilarMovies(
      num movie_id);
}
