import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';

class MovieDetailsOne extends StatelessWidget {
  const MovieDetailsOne({Key? key, required this.movieDetails})
      : super(key: key);

  final MovieDetailsModel movieDetails;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 230,
              color: Colors.white,
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${movieDetails.posterPath!}',
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(Icons.alarm),
              )),
        ],
      ),
    );
  }
}
