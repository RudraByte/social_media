import 'package:social_media_app/models/comment_model.dart';
import 'package:social_media_app/models/user_model.dart';

import '../models/post_model.dart';
import '../api/api_service.dart';

class AppData {
  static final AppData _instance = AppData._internal();
  factory AppData() => _instance;
  AppData._internal();

  List<PostModel> posts = [];
  List<CommentModel> comments = [];
  List<UserModel> users = [];

  Future<void> fetchPosts() async {
    posts = await ApiService().fetchPosts();
  }

  Future<void> fetchComments() async {
    comments = await ApiService().fetchComments();
  }

  Future<void> fetchUsers() async {
    users = await ApiService().fetchUsers();
  }
}

