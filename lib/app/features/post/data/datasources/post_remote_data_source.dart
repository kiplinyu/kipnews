import 'package:dio/dio.dart';
import '../models/post_model.dart';

class PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSource(this.dio);

  Future<List<PostModel>> getPosts() async {
    final response = await dio.get('/posts');
    return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
  }

  Future<PostModel> createPost(PostModel post) async {
    final response = await dio.post('/posts', data: post.toJson());
    return PostModel.fromJson(response.data);
  }
}
