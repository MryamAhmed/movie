import "package:dio/dio.dart";
import 'package:flutter/material.dart';

import '../../features/splash/errors/failure.dart';

class ApiServices {
  //final apiKey = '79c05e937131679e01142ef81e800843';

  final Dio _dio;

  ApiServices(this._dio);

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryPram,
  }) async {
    try {
      var response = await _dio.get(endPoint, queryParameters: queryPram);

      return response.data;

      ///why data
    } catch (e) {
      if (e is DioException) {
        debugPrint('woow $e');
        throw (ServerFailure.fromDioError(e));
      } else {
        debugPrint('woow $e');
        throw (ServerFailure(e.toString()));
      }
    }
  }
}

final x = ApiServices(Dio());
