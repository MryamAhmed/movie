import 'package:dio/dio.dart';

import '../errors/failure.dart';
import 'api_service.dart';

class DioConsumer implements ApiServices {
  final Dio _dio;

  DioConsumer(this._dio);

  @override
  Future get({
    required String endPoint,
    Map<String, dynamic>? queryPrams,
  }) async {
    try {
      var response = await _dio.get(endPoint, queryParameters: queryPrams);
      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw (ServerFailure.fromDioError(e));
      } else {
        throw (ServerFailure(e.toString()));
      }
    }
  }
}
