import 'package:kipnews/app/features/post/business/entities/post_entities.dart';
import 'package:kipnews/app/features/post/business/repositories/post_repositories.dart';

class CreatePost {
  final PostRepository repository;

  CreatePost(this.repository);

  Future<PostEntities> call(PostEntities post) {
    return repository.createPost(post);
  }
}
