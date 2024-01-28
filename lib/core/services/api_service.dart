abstract class ApiServices {
  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryPrams,
  });
}
