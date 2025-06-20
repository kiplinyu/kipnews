import '../repositories/news_repository.dart';
import '../entities/news_entity.dart';


class LogoutUsecase {
  final NewsRepository repository;

  LogoutUsecase(this.repository);

  Future<List<NewsEntity>> call() async {
    return await repository.getNews();
  }
}
