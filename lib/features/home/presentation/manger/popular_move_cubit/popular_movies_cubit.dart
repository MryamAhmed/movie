import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';
import 'package:movies/features/home/data/repo/home_repo.dart';

part 'popular_movies_state.dart';

class GetPopularMoviesCubit extends Cubit<GetPopularMoviesState> {
  GetPopularMoviesCubit(this.homeRepo) : super(GetPopularMoviesInitial());

  static GetPopularMoviesCubit get(context) {
    return BlocProvider.of(context);
  }

  final HomeRepo homeRepo;

  Future<Either<String, List<MovieDetailsModel>>> getPopularMovies() async {
    emit(GetPopularMoviesLoading());

    var x = await homeRepo.getPopularMovies();

    x.fold((l) => emit(GetPopularMoviesFailure(l.toString())),
        (r) => emit(GetPopularMoviesSuccess(r)));

    return x;
  }
}
