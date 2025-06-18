import 'package:dio/dio.dart';
import 'package:kipnews/app/core/errors/failure.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options.baseUrl = 'https://api.example.com';
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<Response> get(String path) async {
    try {
      return await _dio.get(path);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Failure _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return const NetworkFailure('Connection timeout');
    }
    return ServerFailure(e.response?.data['error'] ?? 'Unknown server error');
  }
}
