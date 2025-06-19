import 'package:flutter/material.dart';

import '../../business/entities/news_entity.dart';
import '../../business/usecases/get_news.dart';

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
