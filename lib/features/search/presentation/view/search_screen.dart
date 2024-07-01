import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/search/presentation/view/widget/search_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../manger/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SearchMovieCubit>(),
      child: const SearchBody(),
    );

    // return BlocProvider(
    //   create: (BuildContext context) {
    //     return getIt<SearchMovieCubit>();
    //   },
    //   child: const SearchBody(),
    // );
  }
}
