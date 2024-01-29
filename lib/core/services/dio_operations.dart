import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

Dio dioInit() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org',
      connectTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    options.queryParameters.addAll({
      'api_key': '79c05e937131679e01142ef81e800843',
    });
    return handler.next(options);
  }));

  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      logPrint: (Object object) {
        debugPrint(object.toString());
      },
    ),
  );

  return dio;
}
