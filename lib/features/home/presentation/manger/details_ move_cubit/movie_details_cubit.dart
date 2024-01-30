import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';
import 'package:movies/features/home/data/repo/home_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.homeRepo) : super(MovieDetailsInitial());

  static MovieDetailsCubit get(context) {
    return BlocProvider.of(context);
  }

  final HomeRepo homeRepo;

  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
      num movieId) async {
    emit(GetMovieDetailsLoading());

    var x = await homeRepo.getMovieDetails(movieId);

    x.fold((l) => emit(GetMovieDetailsFailure(l.toString())),
        (r) => emit(GetMovieDetailsSuccess(r)));

    return x;
  }
}
