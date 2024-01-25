import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/movie_model.dart';
import '../../data/repo/home_repo.dart';
part 'get_recommende_movies_state.dart';

class GetRecommendeMoviesCubit extends Cubit<GetRecommendeMoviesState> {
  GetRecommendeMoviesCubit(this.homeRepo) : super(GetRecommendeMoviesInitial());


  final HomeRepo homeRepo;

  Future<Either<Failure,List<MovieDetailsModel>>> getRecommendedMovies() async{
    emit(GetRecommendeMoviesLoading());

    var x =await homeRepo.getRecommendedMovies();

    x.fold((l) =>
        emit(GetRecommendeMoviesFailure(l.toString()))
        , (r) =>
            emit(GetRecommendeMoviesSuccess(r))
    );
    return x;
  }

}
