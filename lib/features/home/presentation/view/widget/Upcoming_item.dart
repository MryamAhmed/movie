import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';
import 'package:movies/features/watched_list/presentation/manager/togel_movie_cubit.dart';

import '../../../../../core/utils/service_locator.dart';
import 'sections/movie_details/movie_details.dart';

class UpcomingItem extends StatelessWidget {
  const UpcomingItem({Key? key, required this.movei}) : super(key: key);

  final MovieDetailsModel movei;

  @override
  Widget build(BuildContext context) {
    var isWishListed =
        getIt<ToggleMovieCubit>().movieBox.keys.contains(movei.id);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MovieDetails(
                    movieId: movei.id!,
                  )),
        );
      },
      child: Stack(
        children: [
          SizedBox(
            height: 140,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: AspectRatio(
                    aspectRatio: 1 / 1.2,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500${movei.posterPath!}',
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.alarm),
                    )),
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              child: InkWell(
                onTap: () {
                  getIt<ToggleMovieCubit>().toggleWatchList(movei.id!, movei);
                },
                child: Container(
                  width: 32,
                  height: 39,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(isWishListed
                          ? "assets/icons/bookmarked_add.png"
                          : "assets/icons/bookmark_add.png"),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
