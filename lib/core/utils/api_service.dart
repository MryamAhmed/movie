import "package:dio/dio.dart";
import '../../features/home/data/models/movie_model.dart';
import '../../features/home/data/repo/home_repo_imple.dart';
import '../errors/failure.dart';

class ApiServices {
  final _baseUrl = 'https://api.themoviedb.org';
  final apiKey = '79c05e937131679e01142ef81e800843';

  final Dio _dio;

  ApiServices(this._dio);

  Future<dynamic> get({required String endPoint, String? searchQuery}) async {

    //https://api.themoviedb.org/3/movie/top_rated?api_key=79c05e937131679e01142ef81e800843

    try {
      var response = await _dio.get('$_baseUrl$endPoint?query=$searchQuery&api_key=$apiKey');

      return response.data;  ///why data
    } catch (e) {
      if (e is DioError) {
        print('woow $e');
        //an instance of ServerFailure is created using the constructor.
        throw (ServerFailure.fromDioError(e));   //the ServerFailure.fromDioError(e) method is called to convert the DioError into a ServerFailure object
      } else {
        print('woow $e');
        throw (ServerFailure(e.toString())); //it captures the error message from the server and creates a ServerFailure object
      }
    }
  }
}
