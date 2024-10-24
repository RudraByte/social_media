import 'package:dio/dio.dart';
import '../models/post_model.dart';
import '../models/comment_model.dart';
import '../models/user_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await _dio.get('$baseUrl/posts');
      return (response.data as List).map((post) => PostModel.fromJson(post)).toList();
    } catch (e) {
      throw Exception('Failed to fetch posts');
    }
  }

  Future<List<CommentModel>> fetchComments() async {
    try {
      Response response = await _dio.get('$baseUrl/comments');
      return (response.data as List).map((comment) => CommentModel.fromJson(comment)).toList();
    } catch (e) {
      throw Exception('Failed to fetch comments');
    }
  }

  Future<List<UserModel>> fetchUsers() async {
    try {
      Response response = await _dio.get('$baseUrl/users');
      return (response.data as List).map((user) => UserModel.fromJson(user)).toList();
    } catch (e) {
      throw Exception('Failed to fetch users');
    }
  }

}
