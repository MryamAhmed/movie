part of 'more_like_this_cubit.dart';

abstract class MoreLikeThisState {}

class MoreLikeThisInitial extends MoreLikeThisState {}

class MoreLikeThisLoading extends MoreLikeThisInitial {}

class MoreLikeThisFailure extends MoreLikeThisInitial {
  final String errorMessage;

  MoreLikeThisFailure(this.errorMessage);
}

class MoreLikeThisSuccess extends MoreLikeThisInitial {
  final List<MovieDetailsModel> similarMovies;

  MoreLikeThisSuccess(this.similarMovies);
}
