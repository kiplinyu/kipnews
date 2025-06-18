import 'package:kipnews/app/features/post/business/entities/post_entities.dart';
import 'package:kipnews/app/features/post/business/repositories/post_repositories.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);

  Future<List<PostEntities>> call() => repository.getPosts();
}
