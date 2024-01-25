import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/search/presentation/manger/search_cubit.dart';
import 'package:movies/features/search/presentation/view/widget/search_body.dart';

import '../../../../core/utils/api_service.dart';
import '../../data/repo/search_repo_impl.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return SearchMovieCubit(
          SearchRepoImplementation(ApiServices(Dio())),
        );
      },
      child: const SearchBody(),
    );
  }
}

