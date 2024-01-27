import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/service_locator.dart';
import 'package:movies/features/home/presentation/view/widget/sections/movie_details/movie_details.dart';

import '../../manager/togel_movie_cubit.dart';
import 'watched_movie_item.dart';

class WatchedListBody extends StatelessWidget {
  const WatchedListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<togelMovieCubit, TogelMovieState>(
      builder: (BuildContext context, state) {
        if (getIt<togelMovieCubit>().movies.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: getIt<togelMovieCubit>().movies.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetails(
                                    movieId: getIt<togelMovieCubit>()
                                        .movies[index]
                                        .id!,
                                  )),
                        );
                      },
                      child: WatchedMovieItem(
                        result: getIt<togelMovieCubit>().movies[index],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(), //
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            ),
          );
        } else {
          return const Expanded(
            child: Center(
              child: Text(
                "No movies in watchlist.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26),
              ),
            ),
          );
        }
      },
    );
  }
}
