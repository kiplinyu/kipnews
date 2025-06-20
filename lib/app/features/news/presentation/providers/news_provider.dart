import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kipnews/app/features/news/data/datasources/news_remote_data_source.dart';
import 'package:kipnews/app/features/news/data/repositories/news_repository_impl.dart';

import '../../../../core/connection/dio_client.dart';
import '../../business/entities/news_entity.dart';
import '../../business/usecases/get_news.dart';

final newsProvider = ChangeNotifierProvider((ref) {
  final dio = ref.read(newsApi); // inject Dio
  final remote = NewsRemoteDatasource(dio); // inject ke remote
  final repo = NewsRepositoryImpl(remote);       // inject ke repository
  final usecase = GetNews(repo); // inject ke usecase
  return NewsProvider(usecase);                  // inject ke provider
});

class NewsProvider extends ChangeNotifier {
  final GetNews getNews;
  List<NewsEntity> _news = [];
  List<NewsEntity> _mynews = [];
  bool _isLoading = false;

  List<NewsEntity> get news => _news;
  List<NewsEntity> get mynews => _mynews;
  bool get isLoading => _isLoading;

  NewsProvider(this.getNews);

  Future<void> loadNews() async {
    _isLoading = true;
    notifyListeners();
    _news = await getNews();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMyNews() async {
    _isLoading = true;
    notifyListeners();
    _mynews = await getNews.getMyNews();
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> logout() async {
    final result = await getNews.repository.logout();
    await loadMyNews();
    notifyListeners();
    return result;
  }

  Future<bool> delete(String id) async {
    final result = await getNews.repository.delete(id);
    await loadMyNews();
    notifyListeners();
    return result;
  }

  Future<bool> upload({
    String? id,
    required String title,
    required String summary,
    required String content,
    required String category,
    required String imageUrl,
    required bool isEdit
  }) async {
    final result = await getNews.upload(
      id: id,
      title: title,
      summary: summary,
      content: content,
      category: category,
      imageUrl: imageUrl,
      isEdit: isEdit,
    );
    await loadMyNews();
    notifyListeners();
    return result;
  }
}
