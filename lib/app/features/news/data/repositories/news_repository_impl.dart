import '../../business/entities/news_entity.dart';
import '../datasources/news_remote_data_source.dart';
import '../../business/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDatasource remoteDatasource;

  NewsRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<NewsEntity>> getNews() async {
    final result = await remoteDatasource.fetchNews();
    return result.map((e) => e.toEntity()).toList();
  }
}

