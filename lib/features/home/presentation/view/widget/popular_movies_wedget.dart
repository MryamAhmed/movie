import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({Key? key,required this.movieModel}) : super(key: key);

  final MovieDetailsModel movieModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Container(
            width: double.infinity,
            //width: 650,
            height: 240,
            color: Colors.white,
            child: CachedNetworkImage(
              imageUrl:
              'https://image.tmdb.org/t/p/w500${movieModel.posterPath}',
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Icon(Icons.alarm),
            ),
          ),
          Positioned(
              top: 242,
              left: 150,
              child: Text(
                movieModel.title!,
                style: const TextStyle(color: Colors.white,fontSize:10),
              )
          ),
          Positioned(
            top: 110,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                width: 125,
                height: 160,
                color: Colors.red,
                child: CachedNetworkImage(
                  // bloc builder
                  imageUrl:
                  'https://image.tmdb.org/t/p/w500${movieModel.posterPath}',
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => const Icon(Icons.alarm),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
