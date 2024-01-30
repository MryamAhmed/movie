import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';
import 'package:movies/features/home/data/repo/home_repo.dart';

part 'more_like_this_state.dart';

class MoreLikeThisCubit extends Cubit<MoreLikeThisState> {
  MoreLikeThisCubit(this.homeRepo) : super(MoreLikeThisInitial());

  static MoreLikeThisCubit get(context) {
    return BlocProvider.of(context);
  }

  final HomeRepo homeRepo;

  Future<Either<Failure, List<MovieDetailsModel>>> getMoreLikeThisMovies(
      num idMovie) async {
    emit(MoreLikeThisLoading());

    var x = await homeRepo.getSimilarMovies(idMovie);

    x.fold((l) => emit(MoreLikeThisFailure(l.toString())),
        (r) => emit(MoreLikeThisSuccess(r)));
    return x;
  }
}
