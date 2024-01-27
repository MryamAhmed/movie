part of 'movie_details_cubit.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class GetMovieDetailsLoading extends MovieDetailsState {}

class GetMovieDetailsFailure extends MovieDetailsState {
  final String errorMessage;
  GetMovieDetailsFailure(this.errorMessage);
}

class GetMovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsModel movieDetails;
  GetMovieDetailsSuccess(this.movieDetails);
}
