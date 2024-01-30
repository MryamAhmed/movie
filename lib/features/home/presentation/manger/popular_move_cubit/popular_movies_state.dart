part of 'popular_movies_cubit.dart';

@immutable
abstract class GetPopularMoviesState {}

class GetPopularMoviesInitial extends GetPopularMoviesState {}

class GetPopularMoviesLoading extends GetPopularMoviesState {}

class GetPopularMoviesFailure extends GetPopularMoviesState {
  final String errorMessage;
  GetPopularMoviesFailure(this.errorMessage);
}

class GetPopularMoviesSuccess extends GetPopularMoviesState {
  final List<MovieDetailsModel> popularMovies;
  GetPopularMoviesSuccess(this.popularMovies);
}
