import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/data/models/movie_details_model.dart';
import '../../data/repo/search_repo.dart';

part 'search_state.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  SearchMovieCubit(this.searchRepo) : super(SearchMovieInitial());
  final TextEditingController searchController = TextEditingController();

  static SearchMovieCubit get(context) {
    return BlocProvider.of(context);
  }

  final SearchRepo searchRepo;

  Future<Either<Failure, List<MovieDetailsModel>>> searchMovie() async {
    emit(SearchMovieLoading());

    var x = await searchRepo.searchMovie(searchController.text);

    x.fold((l) => emit(SearchMovieFailure(l.toString())),
        (r) => emit(SearchMovieSuccess(r)));

    return x;
  }
}
