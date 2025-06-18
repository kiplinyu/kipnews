import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kipnews/app/features/post/business/entities/post_entities.dart';
import 'package:kipnews/app/features/post/business/usecases/create_post.dart';
import 'package:kipnews/app/features/post/business/usecases/get_post.dart';
import 'package:kipnews/app/features/post/data/datasources/post_remote_data_source.dart';
import 'package:kipnews/app/features/post/data/repositories/post_repositories_impl.dart';
import '../../../../core/connection/dio_client.dart';

final postRemoteDataSourceProvider = Provider<PostRemoteDataSource>((ref) {
  final dio = ref.watch(learnApi);
  return PostRemoteDataSource(dio);
});

final postRepositoryProvider = Provider<PostRepositoryImpl>((ref) {
  final remote = ref.watch(postRemoteDataSourceProvider);
  return PostRepositoryImpl(remote);
});

final getPostsProvider = Provider<GetPosts>((ref) {
  final repo = ref.watch(postRepositoryProvider);
  return GetPosts(repo);
});

final postProvider = FutureProvider<List<PostEntities>>((ref) async {
  final usecase = ref.watch(getPostsProvider);
  return usecase();
});

final createPostProvider = Provider<CreatePost>((ref) {
  final repo = ref.watch(postRepositoryProvider);
  return CreatePost(repo);
});

final addPostNotifierProvider =
    StateNotifierProvider<AddPostNotifier, AsyncValue<PostEntities>>((ref) {
      final usecase = ref.watch(createPostProvider);
      return AddPostNotifier(usecase);
    });

class AddPostNotifier extends StateNotifier<AsyncValue<PostEntities>> {
  final CreatePost usecase;

  AddPostNotifier(this.usecase) : super(const AsyncValue.loading());

  Future<void> addPost(PostEntities post) async {
    state = const AsyncValue.loading();
    try {
      final result = await usecase(post);
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
