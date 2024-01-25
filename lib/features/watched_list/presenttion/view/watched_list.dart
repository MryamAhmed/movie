import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/watched_list/presenttion/view/wedgit/watched_list_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../manager/togel_movie_cubit.dart';

class WatchedList extends StatelessWidget {
  const WatchedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<TogelMovieCubit>(),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'WactchList',
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
