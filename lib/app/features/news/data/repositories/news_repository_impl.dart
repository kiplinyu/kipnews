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

  @override
  Future<List<NewsEntity>> getMyNews() async {
    final result = await remoteDatasource.fetchMyNews();
    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Future<bool> logout() async{
    final result = await remoteDatasource.logout();
    return result;
  }
}

