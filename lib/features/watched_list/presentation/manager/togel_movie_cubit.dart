import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';

part 'togel_movie_state.dart';

class togelMovieCubit extends Cubit<TogelMovieState> {
  togelMovieCubit() : super(AddMovieInitial());

  var movieBox = Hive.box('watched_list');

  List<MovieDetailsModel> movies = [];

  void toggleWatchList(num movieId, MovieDetailsModel movieDetails) async {
    if (movieBox.keys.contains(movieId)) {
      //remove it
      removeMovie(movieId.toInt(), movieDetails);
      emit(MovieDidntWatched());
    } else {
      //dd it
      addMovie(movieDetails, movieId.toInt());
      emit(MovieWatched());
    }
  }

  void addMovie(MovieDetailsModel movie, num movieId) async {
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
