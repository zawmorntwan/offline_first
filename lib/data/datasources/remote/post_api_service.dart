import 'package:dio/dio.dart';
import '../../models/post_model.dart';

class PostApiService {
  final Dio _dio;

  PostApiService(this._dio);

  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Failed to fetch from API: \$e');
    }
  }

  Future<PostModel> createPost(Map<String, dynamic> payload) async {
    try {
      // JSONPlaceholder expects userId, title, body.
      final response = await _dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: payload,
      );
      if (response.statusCode == 201) {
        return PostModel.fromJson(response.data);
      } else {
        throw Exception('Failed to create post');
      }
    } catch (e) {
      throw Exception('Failed to create post via API: \$e');
    }
  }
}

