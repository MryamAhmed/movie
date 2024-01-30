import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MovieDetailsModel>>> searchMovie(
      String searchQuery);
}
