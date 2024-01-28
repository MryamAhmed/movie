import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/utils/service_locator.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';

import '../../../splash/errors/failure.dart';
import '../../data/repo/home_repo.dart';

part 'get_recommend_movies_state.dart';

class GetRecommendMoviesCubit extends Cubit<GetRecommendMoviesState> {
  GetRecommendMoviesCubit() : super(GetRecommendMoviesInitial());

  final HomeRepo homeRepo = getIt();

  Future<Either<Failure, List<MovieDetailsModel>>>
      getRecommendedMovies() async {
    emit(GetRecommendMoviesLoading());

    var x = await homeRepo.getRecommendedMovies();

    x.fold((l) => emit(GetRecommendMoviesFailure(l.toString())),
        (r) => emit(GetRecommendMoviesSuccess(r)));
    return x;
  }
}
