import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';

import '../../../../core/errors/failure.dart';
import '../../data/repo/home_repo.dart';

part 'get_up_comming_movie_state.dart';

class GetUpCommingMovieCubit extends Cubit<GetUpCommingMovieState> {
  GetUpCommingMovieCubit(this.homeRepo) : super(GetUpCommingMovieInitial());

  final HomeRepo homeRepo;

  Future<Either<Failure, List<MovieDetailsModel>>> getUpComingMovies() async {
    emit(GetUpComingMoviesLoading());

    var x = await homeRepo.getUpComingMovies();

    print('data is $x');

    x.fold((l) => emit(GetUpComingMoviesFailure(l.toString())),
        (r) => emit(GetUpComingMoviesSuccess(r)));
    return x;
  }
}
