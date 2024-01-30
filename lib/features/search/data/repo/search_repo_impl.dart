import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../home/data/models/movie_details_model.dart';
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

      List<MovieDetailsModel> moveList = [];

      for (var item in data['results']) {
        moveList.add(MovieDetailsModel.fromJson(item));
      }

      return right(moveList);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }
}
