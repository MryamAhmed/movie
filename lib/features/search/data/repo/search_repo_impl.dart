import 'package:dartz/dartz.dart';
import 'package:movies/core/utils/api_service.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';
import 'package:movies/features/splash/errors/failure.dart';

import 'search_repo.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiServices apiService;

  SearchRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<MovieDetailsModel>>> searchMovie(
      String searchQuery) async {
    try {
      var data = await apiService.get(endPoint: '/3/search/movie', queryPram: {
        'query': searchQuery,
      });

      List<MovieDetailsModel> moveiList = [];

      for (var item in data['results']) {
        moveiList.add(MovieDetailsModel.fromJson(item));
      }

      return right(moveiList);
    } on ServerFailure catch (e) {
      print(' errror${e.errMessage}');
      return left(e);
    }
  }
}
