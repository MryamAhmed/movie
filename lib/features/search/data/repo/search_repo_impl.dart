import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:movies/core/utils/api_service.dart';
import 'package:movies/features/home/data/models/movie_details_model.dart';
import 'package:movies/features/home/data/models/movie_model.dart';
import 'search_repo.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiServices apiService;

  SearchRepoImplementation(this.apiService);

  @override
  Future<Either<Failure,List<MovieDetailsModel>>> searchMovie(String search_query) async{
    try {
      var data = await apiService.get(endPoint: '/3/search/movie', searchQuery:search_query);

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