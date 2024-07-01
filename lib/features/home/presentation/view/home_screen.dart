import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/home_screen_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: HomeViewBody(),
    );
  }
}
