import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';

class MovieDetailsTwo extends StatelessWidget {
  const MovieDetailsTwo({Key? key, required this.movieDetails})
      : super(key: key);
  final MovieDetailsModel movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movieDetails.title!),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 190,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: AspectRatio(
                            aspectRatio: .8 / 1.2,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500${movieDetails.posterPath!}',
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
                        onTap: () {},
                        child: Container(
                          width: 32,
                          height: 39,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/icons/bookmark_add.png"),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 240,
                    child: Text(
                      movieDetails.overview!,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffF8AE1C),
                      ),
                      Text(movieDetails.voteAverage!.toString()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
