import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../../watched_list/presentation/manager/togel_movie_cubit.dart';
import 'sections/movie_details/move_details.dart';

class TopRatedItem extends StatelessWidget {
  const TopRatedItem({Key? key, required this.moveModel}) : super(key: key);

  final MovieDetailsModel moveModel;

  @override
  Widget build(BuildContext context) {
    final isWishListed =
        getIt<ToggleMovieCubit>().movieBox.keys.contains(moveModel.id);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MovieDetails(
                    movieId: moveModel.id!,
                  )),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: AspectRatio(
                        aspectRatio: 1 / 1.2,
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500${moveModel.posterPath!}',
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
                      getIt<ToggleMovieCubit>()
                          .toggleWatchList(moveModel.id!, moveModel);
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
          SizedBox(
            width: 110,
            child: Text(
              moveModel.title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            moveModel.voteAverage!.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
