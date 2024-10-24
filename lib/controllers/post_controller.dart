import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:social_media_app/appdata.dart';
import '../models/post_model.dart';

class PostController extends GetxController {
  var posts = <PostModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      await AppData().fetchPosts();
      posts.value = AppData().posts;
    } catch (e) {
      errorMessage('Failed to load posts');
    } finally {
      isLoading(false);
    }
  }

  void createPost(String title, String body) async {
    try {
      final response = await Dio().post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {
          'title': title,
          'body': body,
          'userId': 1, 
        },
      );

      if (response.statusCode == 201) {
        var newPost = PostModel(
          userId: 1,
          id: response.data['id'],
          title: response.data['title'],
          body: response.data['body'],
        );
        posts.add(newPost); 
        Get.snackbar('Success', 'Post created successfully', snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to create post', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
