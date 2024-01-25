part of 'get_recommende_movies_cubit.dart';

@immutable
abstract class GetRecommendeMoviesState {}

class GetRecommendeMoviesInitial extends GetRecommendeMoviesState {}


class GetRecommendeMovieInitial extends GetRecommendeMoviesState {}


class GetRecommendeMoviesLoading extends GetRecommendeMoviesState {}

class GetRecommendeMoviesFailure extends GetRecommendeMoviesState {
  final String errorMessage;
  GetRecommendeMoviesFailure(this.errorMessage);
}

class GetRecommendeMoviesSuccess extends GetRecommendeMoviesState {
  final List<MovieDetailsModel> recommendeMovies;
  GetRecommendeMoviesSuccess(this.recommendeMovies);
}


