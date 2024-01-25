import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/service_locator.dart';
import 'package:movies/features/home/presentation/view/widget/sections/movie_details/movie_details.dart';
import 'package:movies/features/watched_list/presenttion/manager/togel_movie_cubit.dart';
import 'package:movies/features/watched_list/presenttion/view/wedgit/watched_movie_iteam.dart';

class WatchedListBody extends StatelessWidget {
  const WatchedListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogelMovieCubit, TogelMovieState>(
      builder: (BuildContext context, state) {
        if (getIt<TogelMovieCubit>().movies.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: getIt<TogelMovieCubit>().movies.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetails(
                                    movieId: getIt<TogelMovieCubit>()
                                        .movies[index]
                                        .id!,
                                  )),
                        );
                      },
                      child: WatchedMovieItem(
                        result: getIt<TogelMovieCubit>().movies[index],
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

/*
ListView.separated(
                itemBuilder: (context,index) {


                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  MovieDetails(movieId: TogelMovieCubit.get(context).movies[index].id!,)),
                        );
                      },
                      child:  WatchedMovieItem(result: TogelMovieCubit.get(context).movies[index],),
                    );
              }
                , separatorBuilder: (context, index) => Container(
              color: Colors.grey,
              height: 2,
            ),
              itemCount: TogelMovieCubit.get(context).movies.length,

            ),
 */
