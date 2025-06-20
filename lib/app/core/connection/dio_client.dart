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
import 'package:shared_preferences/shared_preferences.dart';

// 1. Factory function
Dio _makeDio(String baseUrl) {
  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
      validateStatus: (status) => true,
    ),
  )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true))
    ..interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      print("🔍 Cek token: $token");
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token'; // ✅ Tambahkan header
        print('🧾 Kirim token: $token');
      }
      return handler.next(options);
    },
  ));
}

// 2. Provider untuk JSONPlaceholder
final learnApi = Provider<Dio>((_) {
  return _makeDio('https://jsonplaceholder.typicode.com');
});

// 3. Provider untuk API lain
final newsApi = Provider<Dio>((_) {
  return _makeDio('http://45.149.187.204:3000/api/');
});
