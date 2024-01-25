import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';

part 'togel_movie_state.dart';

class TogelMovieCubit extends Cubit<TogelMovieState> {
  TogelMovieCubit() : super(AddMovieInitial());

  var movieBox = Hive.box('watched_list');

  List<MovieDetailsModel> movies = [];
  // void populateList() {
  //   movies = moviesBox.values.map((movie) => movie as MovieDetails).toList();
  // }

  void toggleWatchList(num movieId, MovieDetailsModel movieDetails) async {
    if (movieBox.keys.contains(movieId)) {
      print('gggggggggggggggggggg');
      //remove it
      removeMovie(movieId.toInt(), movieDetails);
      emit(MovieDidntWatched());
    } else {
      //dd it
      AddMovie(movieDetails, movieId.toInt());
      emit(MovieWatched());
    }
  }

  void AddMovie(MovieDetailsModel movie, num movieId) async {
    print('ADDDDDDDD');
    emit(AddMovieLoading());
    try {
      await movieBox.put(movieId, movie);
      emit(AddMovieSuccess());
      movies.add(movie);
    } catch (e) {
      emit(AddMovieFauilar(e.toString()));
    }
  }

  void removeMovie(num movieId, MovieDetailsModel movie) async {
    emit(DeleteMovieLoading());
    try {
      await movieBox.delete(movieId);
      movies.remove(movie);
      emit(DeleteMovieSuccess());
    } catch (e) {
      emit(DeleteMovieFauilar(e.toString()));
    }
  }
}
