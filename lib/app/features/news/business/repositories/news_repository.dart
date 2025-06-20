import '../entities/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> getNews();
  Future<List<NewsEntity>> getMyNews();
  Future<bool> logout();
}