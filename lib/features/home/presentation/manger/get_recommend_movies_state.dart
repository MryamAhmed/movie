part of 'get_recommend_movies_cubit.dart';

abstract class GetRecommendMoviesState {}

class GetRecommendMoviesInitial extends GetRecommendMoviesState {}

class GetRecommendMovieInitial extends GetRecommendMoviesState {}

class GetRecommendMoviesLoading extends GetRecommendMoviesState {}

class GetRecommendMoviesFailure extends GetRecommendMoviesState {
  final String errorMessage;
  GetRecommendMoviesFailure(this.errorMessage);
}

class GetRecommendMoviesSuccess extends GetRecommendMoviesState {
  final List<MovieDetailsModel> recommendMovies;
  GetRecommendMoviesSuccess(this.recommendMovies);
}
