import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kipnews/app/features/news/business/repositories/news_repository.dart';
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
  bool _isLoading = false;

  List<NewsEntity> get news => _news;
  bool get isLoading => _isLoading;

  NewsProvider(this.getNews);

  Future<void> loadNews() async {
    _isLoading = true;
    notifyListeners();
    _news = await getNews();
    _isLoading = false;
    notifyListeners();
  }
}
