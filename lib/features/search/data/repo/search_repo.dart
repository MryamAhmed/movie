import 'package:dartz/dartz.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';
import 'package:movies/features/splash/errors/failure.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MovieDetailsModel>>> searchMovie(
      String search_query);
}
