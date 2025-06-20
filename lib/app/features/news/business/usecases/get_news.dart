import '../repositories/news_repository.dart';
import '../entities/news_entity.dart';


class GetNews {
  final NewsRepository repository;

  GetNews(this.repository);

  Future<List<NewsEntity>> call() async {
    return await repository.getNews();
  }

  Future<List<NewsEntity>> getMyNews() async {
    return await repository.getMyNews();
  }
}
