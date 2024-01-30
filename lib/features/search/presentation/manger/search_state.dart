part of 'search_cubit.dart';

@immutable
abstract class SearchMovieState {}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoading extends SearchMovieState {}

class SearchMovieFailure extends SearchMovieState {
  final String errorMessage;
  SearchMovieFailure(this.errorMessage);
}

class SearchMovieSuccess extends SearchMovieState {
  final List<MovieDetailsModel> searchMovies;
  SearchMovieSuccess(this.searchMovies);
}
