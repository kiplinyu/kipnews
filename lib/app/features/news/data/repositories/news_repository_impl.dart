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

  Future<bool> delete(String id) async {
    final result = await remoteDatasource.delete(id);
    return result;
  }

  @override
  Future<bool> upload({String? id, required String title, required String summary, required String content, required String category, required String imageUrl,required bool isEdit}) {
    return remoteDatasource.upload(
      id: id,
      title: title,
      summary: summary,
      content: content,
      category: category,
      imageUrl: imageUrl,
      isEdit: isEdit,
    );
  }
}

