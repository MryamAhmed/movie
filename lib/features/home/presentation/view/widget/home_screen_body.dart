import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/extensions/spacing.dart';

import 'sections/popular_movie_section.dart';
import 'sections/top_rated_section.dart';
import 'sections/upcoming_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const PopularMovieSection(),
          10.vertical,
          const UpcomingSection(),
          20.vertical,
          const TopRatedSection(),
          15.vertical, // = SizedBox(height: 15),
        ],
      ),
    );
  }
}
