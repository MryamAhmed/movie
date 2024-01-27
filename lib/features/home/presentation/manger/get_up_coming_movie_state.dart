import '../../data/models/movie_details_model.dart';

abstract class GetUpComingMovieState {}

class GetUpComingMovieInitial extends GetUpComingMovieState {}

class GetUpComingMoviesLoading extends GetUpComingMovieState {}

class GetUpComingMoviesFailure extends GetUpComingMovieState {
  final String errorMessage;
  GetUpComingMoviesFailure(this.errorMessage);
}

class GetUpComingMoviesSuccess extends GetUpComingMovieState {
  final List<MovieDetailsModel> getUpComingMovies;
  GetUpComingMoviesSuccess(this.getUpComingMovies);
}
