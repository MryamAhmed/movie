import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../home/data/models/movie_details_model.dart';

class SearchMovies extends StatelessWidget {
  const SearchMovies({Key? key, required this.result}) : super(key: key);
  final MovieDetailsModel result;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CachedNetworkImage(
          height: 120,
          width: 170,
          imageUrl: 'https://image.tmdb.org/t/p/w500${result.posterPath!}',
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(Icons.alarm),
        ),
        const SizedBox(
          width: 14,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 200),
                  child: Text(
                    result.title!,
                    style: const TextStyle(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Text(result.releaseDate!,
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
        )
      ],
    );
  }
}
