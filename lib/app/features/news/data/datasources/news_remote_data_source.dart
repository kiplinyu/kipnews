import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/news_model.dart';

class NewsRemoteDatasource {
  final Dio dio;

  NewsRemoteDatasource(this.dio);

  Future<List<NewsModel>> fetchNews() async {
    final response = await dio.get('/news');
    final data = response.data['body']['data'] as List;

    return data.map((json) => NewsModel.fromJson(json)).toList();
  }

  Future<List<NewsModel>> fetchMyNews() async {
    final response = await dio.get('/author/news');
    final data = response.data['body']['data'] as List;
    return data.map((json) => NewsModel.fromJson(json)).toList();
  }

  Future<bool> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final result = await prefs.remove('auth_token');
    return result;
  }
}
