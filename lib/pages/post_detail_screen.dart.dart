import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/appdata.dart';
import '../models/post_model.dart';
import '../models/comment_model.dart';
import '../models/user_model.dart';

class PostDetailsScreen extends StatefulWidget {
  final PostModel post;

  PostDetailsScreen({required this.post});

  @override
  _PostDetailsScreenState createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  List<CommentModel> comments = [];
  UserModel? user;

  @override
  void initState() {
    super.initState();
    loadPostDetails();
  }

  Future<void> loadPostDetails() async {
    try {
      await AppData().fetchComments();
      await AppData().fetchUsers();

      setState(() {
        comments = AppData()
            .comments
            .where((comment) => comment.postId == widget.post.id)
            .toList();
        user = AppData().users.firstWhere((u) => u.id == widget.post.userId);
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to load details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user!.name, style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
           decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.white], 
              begin: Alignment.topCenter,  
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                       decoration: const BoxDecoration(color: Color.fromARGB(255, 234, 234, 234), borderRadius: BorderRadius.all(Radius.circular(10))),
          
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                            '${widget.post.title}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              
                            ),
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
                      const SizedBox(height:10 ,),
                Container(
                       decoration: const BoxDecoration(color: Color.fromARGB(255, 234, 234, 234), borderRadius: BorderRadius.all(Radius.circular(10))),
          
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.post.body,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
          
                if (user != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      
                      Text('Email: ${user!.email}',style: const TextStyle(color: Colors.white),),
                      Text('Phone: ${user!.phone}',style: const TextStyle(color: Colors.white)),
                      const SizedBox(height: 10),
                    ],
                  ),
          
                const Divider(),
          
                const Center(
                  child: Text(
                    'Comments',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                comments.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                       decoration: const BoxDecoration(color: Color.fromARGB(255, 234, 234, 234), borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: comments.length,
                          itemBuilder: (context, index) {
                            CommentModel comment = comments[index];
                            return ListTile(
                              title: Text(comment.name),
                              subtitle: Text(comment.body),
                            );
                          },
                        ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
