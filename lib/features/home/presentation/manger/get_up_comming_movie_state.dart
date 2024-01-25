part of 'get_up_comming_movie_cubit.dart';

@immutable
abstract class GetUpCommingMovieState {}

class GetUpCommingMovieInitial extends GetUpCommingMovieState {}

class GetUpComingMoviesLoading extends GetUpCommingMovieState {}

class GetUpComingMoviesFailure extends GetUpCommingMovieState {
  final String errorMessage;
  GetUpComingMoviesFailure(this.errorMessage);
}

class GetUpComingMoviesSuccess extends GetUpCommingMovieState {
  final List<MovieDetailsModel> getUpComingMovies;
  GetUpComingMoviesSuccess(this.getUpComingMovies);
}


