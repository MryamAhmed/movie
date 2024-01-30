part of 'togel_movie_cubit.dart';

abstract class TogelMovieState {}

class AddMovieInitial extends TogelMovieState {}

class AddMovieLoading extends TogelMovieState {}

class AddMovieSuccess extends TogelMovieState {}

class AddMovieFauilar extends TogelMovieState {
  String error;
  AddMovieFauilar(this.error);
}

class MovieWatched extends TogelMovieState {}

class MovieDidNotWatched extends TogelMovieState {}

class DeleteMovieLoading extends TogelMovieState {}

class DeleteMovieSuccess extends TogelMovieState {}

class DeleteMovieFauilar extends TogelMovieState {
  String error;
  DeleteMovieFauilar(this.error);
}
