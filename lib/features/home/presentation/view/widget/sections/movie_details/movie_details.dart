import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/api_service.dart';
import 'package:movies/core/widgets/custom_error.dart';
import 'package:movies/features/home/data/repo/home_repo_impl.dart';
import 'package:movies/features/home/presentation/manger/more_like_this_cubit.dart';
import 'package:movies/features/home/presentation/manger/movie_details_cubit.dart';
import 'package:movies/features/home/presentation/view/widget/sections/movie_details/more_like_this_list_view.dart';
import 'package:movies/features/home/presentation/view/widget/sections/movie_details/movei_details_one.dart';
import 'package:movies/features/home/presentation/view/widget/sections/movie_details/movie_details_two.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key,required this.movieId}) : super(key: key);
  final num movieId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => MovieDetailsCubit(
              HomeRepoImplementation(ApiServices(Dio())),
            )..getMovieDetails(movieId),
          ),
          BlocProvider(
              create: (BuildContext context) => MoreLikeThisCubit(
                HomeRepoImplementation(ApiServices(Dio())),
              )..getMoreLikeThisMovies(movieId),
          ),
        ],

      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {

          if(state is GetMovieDetailsSuccess){
            return Scaffold(
              appBar: AppBar(
                title:  Text(state.movieDetails.title!),
              ),
              body:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailsOne(movieDetails: state.movieDetails),
                  const SizedBox(
                    height: 2,
                  ),
                  MovieDetailsTwo(movieDetails:state.movieDetails ),
                  const SizedBox(
                    height: 4,
                  ),
                  const MoreLieThisListView()
                ],
              ),
            );
          }else
            if(state is GetMovieDetailsFailure){
            print(state.errorMessage);
            return CustomError(errorMessage: state.errorMessage,);
          }else {
            return const Center(child: CircularProgressIndicator());
          }

        },
      ),
    );
  }
}
