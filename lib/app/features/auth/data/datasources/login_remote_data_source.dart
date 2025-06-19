import 'package:dio/dio.dart';
import '../models/login_response_models.dart';

class LoginRemoteDatasource {
  final Dio dio;

  LoginRemoteDatasource({required this.dio});

  // Future<LoginResponseModel> login(String email, String password) async {
  //   final response = await dio.post(
  //     '/auth/login',
  //     data: {
  //       "email": email,
  //       "password": password,
  //     },
  //   );
  //   return LoginResponseModel.fromJson(response.data['body']['data']);
  // }

  Future<LoginResponseModel> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      // ✅ Pindahkan log "Login Success" ke bawah, setelah validasi
      if (response.statusCode == 200 || response.data['success'] == true) {
        print('✅ Login Success, Token: ${response.data['body']['data']['token']}');
        print('👤 User: ${response.data['body']['data']['author']['email']}');

        return LoginResponseModel.fromJson(response.data['body']['data']);
      } else {
        // ❌ Login gagal, status bukan 200 atau success false
        throw Exception('Bad response: ${response.statusCode}');
      }

    } catch (e) {
      print('🚨 Login Failed: $e');
      rethrow;
    }
  }

}
