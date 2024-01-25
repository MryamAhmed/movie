import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/movie_cubit.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => MovieCubit(),
        child: BlocConsumer<MovieCubit, MovieState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = MovieCubit.get(context);
              return Scaffold(
                body: cubit.screen[cubit.currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    showUnselectedLabels: true,
                    selectedItemColor: Colors.yellow,
                    unselectedFontSize: 12,
                    selectedFontSize: 12,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home, color: Colors.white),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search, color: Colors.white),
                        label: 'Search',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.featured_play_list_outlined,
                          color: Colors.white,
                        ),
                        label: 'WatchList',
                      ),
                    ],
                    currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      print('index = $index');
                      cubit.changeIndex(index);
                    }),
              );
            }));
  }
}
