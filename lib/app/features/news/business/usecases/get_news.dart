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

  Future<bool> upload({
     String? id,
    required String title,
    required String summary,
    required String content,
    required String category,
    required String imageUrl,
    required bool isEdit
  }) async {
    return await repository.upload(
      id: id,
      title: title,
      summary: summary,
      content: content,
      category: category,
      imageUrl: imageUrl,
        isEdit: isEdit
    );
  }
}
