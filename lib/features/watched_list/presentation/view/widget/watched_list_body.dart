import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/service_locator.dart';
import 'package:movies/features/home/presentation/view/widget/sections/movie_details/move_details.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../manager/togel_movie_cubit.dart';
import 'watched_movie_item.dart';

class WatchedListBody extends StatelessWidget {
  const WatchedListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleMovieCubit, TogelMovieState>(
      builder: (BuildContext context, state) {
        if (getIt<ToggleMovieCubit>().movies.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: getIt<ToggleMovieCubit>().movies.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetails(
                                    movieId: getIt<ToggleMovieCubit>()
                                        .movies[index]
                                        .id!,
                                  )),
                        );
                      },
                      child: WatchedMovieItem(
                        result: getIt<ToggleMovieCubit>().movies[index],
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
          return Expanded(
            child: Center(
              child: Text(
                AppStrings.noMoves,
                textAlign: TextAlign.center,
                style: AppStyles.font20.copyWith(fontSize: 26),
              ),
            ),
          );
        }
      },
    );
  }
}
