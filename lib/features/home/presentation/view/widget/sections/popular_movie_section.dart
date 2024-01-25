import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../popular_movies_slider.dart';

class PopularMovieSection extends StatelessWidget {
  const PopularMovieSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopularMoviesSlider();
  }
}
