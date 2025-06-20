import '../entities/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> getNews();
  Future<List<NewsEntity>> getMyNews();
  Future<bool> logout();
  Future<bool> delete(String id);
  Future<bool> upload({String? id,required String title, required String summary, required String content, required String category, required String imageUrl, required bool isEdit});
}