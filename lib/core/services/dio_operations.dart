import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio dioInit() {
  final dio = Dio(
    BaseOptions(
      baseUrl: '${dotenv.env['baseUrl']}',
      connectTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    options.queryParameters.addAll({
      'api_key': '${dotenv.env['api_key']}',
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
