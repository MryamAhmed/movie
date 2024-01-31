import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/view/widget/top_rated_movie_item.dart';

import '../../../../../core/common/widgets/custom_error.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../manger/recommended_move_cubit/recommend_movies_cubit.dart';

class TopRatesMovieListView extends StatelessWidget {
  const TopRatesMovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff353535),
      child: SizedBox(
        width: double.infinity,
        height: 230,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(AppStrings.recommended),
            const SizedBox(
              height: 5,
            ),
            BlocBuilder<GetRecommendMoviesCubit, GetRecommendMoviesState>(
                builder: (context, state) {
              if (state is GetRecommendMoviesSuccess) {
                return SizedBox(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.recommendMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TopRatedItem(
                          moveModel: state.recommendMovies[index],
                        );
                      }),
                );
              } else if (state is GetRecommendMoviesFailure) {
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
