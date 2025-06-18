import 'package:kipnews/app/features/post/business/entities/post_entities.dart';
import 'package:kipnews/app/features/post/business/repositories/post_repositories.dart';
import 'package:kipnews/app/features/post/data/datasources/post_remote_data_source.dart';
import 'package:kipnews/app/features/post/data/models/post_model.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<PostEntities>> getPosts() => remoteDataSource.getPosts();
  @override
  Future<PostEntities> createPost(PostEntities post) async {
    final model = PostModel(
      id: post.id,
      userId: post.userId,
      title: post.title,
      body: post.body,
    );
    final result = await remoteDataSource.createPost(model);
    return result; // karena PostModel extends PostEntities (harusnya)
  }
}
