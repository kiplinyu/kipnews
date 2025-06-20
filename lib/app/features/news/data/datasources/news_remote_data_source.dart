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

  Future<bool> delete(String id) async {
    final response = await dio.delete('/author/news/$id');
    return response.statusCode == 200;
  }

  Future<bool> upload({
    required String? id,
    required String title,
    required String summary,
    required String content,
    required String category,
    required String imageUrl,
    required bool isEdit
  }) async {
    final data = {
      'title': title,
      'summary': summary,
      'content': content,
      'category': category,
      'featuredImageUrl': imageUrl,
      'tags': ["Test2","Test"],
      'isPublished': true,
    };

    final response = isEdit
        ? await dio.put('/author/news/$id', data: data)
        : await dio.post('/author/news', data: data);
    return response.statusCode == 200;
  }
}
