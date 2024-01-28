import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/api_service.dart';
import '../../../home/data/models/movie_details_model.dart';
import '../../../splash/errors/failure.dart';
import 'search_repo.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiServices apiService;

  SearchRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<MovieDetailsModel>>> searchMovie(
      String searchQuery) async {
    try {
      var data = await apiService.get(endPoint: '/3/search/movie', queryPrams: {
        'query': searchQuery,
      });

      List<MovieDetailsModel> moveiList = [];

      for (var item in data['results']) {
        moveiList.add(MovieDetailsModel.fromJson(item));
      }

      return right(moveiList);
    } on ServerFailure catch (e) {
      debugPrint(' errror${e.errMessage}');
      return left(e);
    }
  }
}
