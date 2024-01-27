import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error.dart';
import '../../manger/get_up_coming_movie_cubit.dart';
import '../../manger/get_up_coming_movie_state.dart';
import 'Upcoming_item.dart';

class UpComingListView extends StatelessWidget {
  const UpComingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff353535),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('New Releases'),
            const SizedBox(
              height: 5,
            ),
            BlocBuilder<GetUpComingMovieCubit, GetUpComingMovieState>(
                builder: (context, state) {
              if (state is GetUpComingMoviesSuccess) {
                return SizedBox(
                  height: 140,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.getUpComingMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return UpcomingItem(
                          movei: state.getUpComingMovies[index],
                        );
                      }),
                );
              } else if (state is GetUpComingMoviesFailure) {
                return CustomError(
                  errorMessage: state.errorMessage,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
          ]),
        ),
      ),
    );
  }
}
