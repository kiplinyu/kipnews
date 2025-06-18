// // import 'package:dartz/dartz.dart';
// // import '../../../.././core/errors/failure.dart';
// // import '../../../.././core/params/params.dart';
// // // import '../../../../.././entities/template_entity.dart';

// // abstract class TemplateRepository {
// //   Future<Either<Failure, TemplateEntity>> getTemplate({
// //     required TemplateParams templateParams,
// //   });
// // }

// // features/posts/domain/repositories/post_repository.dart
// import 'package:kipnews/app/features/post/business/entities/post_entities.dart';

// abstract class PostRepositories {
//   Future<List<PostEntities>> getPosts();
//   Future<PostEntities> getPostById(int id);
//   Future<PostEntities> createPost(PostEntities post);
//   Future<PostEntities> updatePost(PostEntities post);
//   Future<void> deletePost(int id);
// }

import 'package:kipnews/app/features/post/business/entities/post_entities.dart';

abstract class PostRepository {
  Future<List<PostEntities>> getPosts();
  Future<PostEntities> createPost(PostEntities post);
}
