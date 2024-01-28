import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../manager/togel_movie_cubit.dart';
import 'widget/watched_list_body.dart';

class WatchedList extends StatelessWidget {
  const WatchedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<ToggleMovieCubit>(),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'WatchList',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              WatchedListBody(),
            ],
          ),
        ),
      ),
    );
  }
}
