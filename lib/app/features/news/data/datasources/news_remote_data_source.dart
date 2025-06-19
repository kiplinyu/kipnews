import 'package:dio/dio.dart';
import '../models/news_model.dart';

class NewsRemoteDatasource {
  final Dio dio;

  NewsRemoteDatasource(this.dio);

  Future<List<NewsModel>> fetchNews() async {
    final response = await dio.get('/news');
    final data = response.data['body']['data'] as List;

    return data.map((json) => NewsModel.fromJson(json)).toList();
  }
}
