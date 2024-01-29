import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/service_locator.dart';
import '/core/widgets/custom_error.dart';
import '/features/home/presentation/manger/more_like_this_cubit.dart';
import '/features/home/presentation/manger/movie_details_cubit.dart';
import '/features/home/presentation/view/widget/sections/movie_details/more_like_this_list_view.dart';
import '/features/home/presentation/view/widget/sections/movie_details/movei_details_one.dart';
import '/features/home/presentation/view/widget/sections/movie_details/movie_details_two.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key, required this.movieId}) : super(key: key);
  final num movieId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              getIt<MovieDetailsCubit>()..getMovieDetails(movieId),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              getIt<MoreLikeThisCubit>()..getMoreLikeThisMovies(movieId),
        ),
      ],
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is GetMovieDetailsSuccess) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.movieDetails.title!),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailsOne(movieDetails: state.movieDetails),
                  const SizedBox(
                    height: 2,
                  ),
                  MovieDetailsTwo(movieDetails: state.movieDetails),
                  const SizedBox(
                    height: 4,
                  ),
                  const MoreLieThisListView()
                ],
              ),
            );
          } else if (state is GetMovieDetailsFailure) {
            debugPrint(state.errorMessage);
            return CustomError(
              errorMessage: state.errorMessage,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
