import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';

import '../../../data/repo/home_repo.dart';

part 'recommend_movies_state.dart';

class GetRecommendMoviesCubit extends Cubit<GetRecommendMoviesState> {
  GetRecommendMoviesCubit(this.homeRepo) : super(GetRecommendMoviesInitial());

  final HomeRepo homeRepo;

  Future<Either<String, List<MovieDetailsModel>>> getRecommendedMovies() async {
    emit(GetRecommendMoviesLoading());

    var x = await homeRepo.getRecommendedMovies();

    x.fold((l) => emit(GetRecommendMoviesFailure(l.toString())),
        (r) => emit(GetRecommendMoviesSuccess(r)));
    return x;
  }
}
