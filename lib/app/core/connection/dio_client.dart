// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final dioClientProvider = Provider<Dio>((ref) {
//   final dio = Dio(
//     BaseOptions(
//       baseUrl: 'https://jsonplaceholder.typicode.com',
//       connectTimeout: const Duration(seconds: 5),
//       receiveTimeout: const Duration(seconds: 3),
//     ),
//   );

//   dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

//   return dio;
// });

// core/dio_client.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Factory function
Dio _makeDio(String baseUrl) {
  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    ),
  )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
}

// 2. Provider untuk JSONPlaceholder
final learnApi = Provider<Dio>((_) {
  return _makeDio('https://jsonplaceholder.typicode.com');
});

// 3. Provider untuk API lain
final newsApi = Provider<Dio>((_) {
  return _makeDio('http://45.149.187.204:3000');
});
