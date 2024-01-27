import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/search/presentation/view/search_screen.dart';

import '../../home/presentation/view/home_screen.dart';
import '../../watched_list/presentation/view/watched_list.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  var currentIndex = 0;

  final List<Widget> screen = const [
    HomeView(),
    SearchScreen(),
    WatchedList(),
  ];

  static MovieCubit get(context) {
    return BlocProvider.of(context);
  }

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavbarState());
  }
}
