import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/custom_error.dart';
import '../../../manger/popular_move_cubit/popular_movies_cubit.dart';
import '../popular_movies_widget.dart';

class PopularMovieSection extends StatelessWidget {
  const PopularMovieSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: double.infinity,
      child: BlocBuilder<GetPopularMoviesCubit, GetPopularMoviesState>(
        builder: (context, state) {
          if (state is GetPopularMoviesSuccess) {
            return CarouselSlider.builder(
              itemCount: state.popularMovies.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return PopularMoviesWidget(
                  movieModel: state.popularMovies[index],
                );
              },
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                height: 290,
                autoPlay: true,
                viewportFraction: 1,
              ),
            );
          } else if (state is GetPopularMoviesFailure) {
            return Center(
              child: CustomError(
                errorMessage: state.errorMessage,
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
