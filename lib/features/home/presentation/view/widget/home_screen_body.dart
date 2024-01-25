import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sections/popular_movie_section.dart';
import 'sections/top_rated_section.dart';
import 'sections/upcoming_section.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
      child: Column(
        children: [
          PopularMovieSection(),
          SizedBox(height: 10,),
          UpcomingSection(),
          SizedBox(height:20,),
          TopRatedSection(),
          SizedBox(height:15,),
        ],
      ),
    );
  }
}