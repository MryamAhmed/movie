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
              items: bottomNavBarItems(),
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> bottomNavBarItems() {
    return <BottomNavigationBarItem>[
      _buildBottomNavigationBarItem(
        label: 'Home',
        icon: Icons.home,
      ),
      _buildBottomNavigationBarItem(
        label: 'Search',
        icon: Icons.search,
      ),
      _buildBottomNavigationBarItem(
        label: 'WatchList',
        icon: Icons.featured_play_list_outlined,
      ),
    ];
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String label,
    required IconData icon,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: label,
    );
  }
}
