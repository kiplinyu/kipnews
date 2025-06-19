import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/connection/dio_client.dart';
import '../../business/entities/user_entity.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../../business/usecase/login_usecase.dart';
import '../../data/datasources/login_remote_data_source.dart';


final loginProvider = ChangeNotifierProvider((ref) {
  final dio = ref.read(newsApi); // inject Dio
  final remote = LoginRemoteDatasource(dio: dio); // inject ke remote
  final repo = LoginRepositoryImpl(remote);       // inject ke repository
  final usecase = LoginUsecase(repository: repo); // inject ke usecase
  return LoginProvider(usecase);                  // inject ke provider
});

class LoginProvider with ChangeNotifier {
  final LoginUsecase _usecase;

  LoginProvider(this._usecase);

  bool isLoading = false;
  String? error;
  UserEntity? user;

  Future<void> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _usecase.execute(email, password);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', response.token);
      // Lanjutkan ke halaman berikutnya
    } catch (e) {
      error = "Login Gagal! Email atau Password Salah.";
      // tampilkan ke UI misalnya dengan snackbar
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

}
