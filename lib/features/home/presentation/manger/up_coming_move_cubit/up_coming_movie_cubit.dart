import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';

import '../../../data/repo/home_repo.dart';
import 'up_coming_movie_state.dart';

class GetUpComingMovieCubit extends Cubit<GetUpComingMovieState> {
  GetUpComingMovieCubit(this.homeRepo) : super(GetUpComingMovieInitial());

  final HomeRepo homeRepo;

  Future<Either<String, List<MovieDetailsModel>>> getUpComingMovies() async {
    emit(GetUpComingMoviesLoading());

    var x = await homeRepo.getUpComingMovies();

    x.fold((l) => emit(GetUpComingMoviesFailure(l.toString())),
        (r) => emit(GetUpComingMoviesSuccess(r)));
    return x;
  }
}
