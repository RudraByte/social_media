import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class CreatePostScreen extends StatelessWidget {
  final PostController postController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Post', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),)),centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 29, 29, 29)], // From black to white
              begin: Alignment.topCenter, 
              end: Alignment.bottomCenter,
            ),
          ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: bodyController,
                maxLines: 5,
                decoration: const InputDecoration(
                  
                  labelText: 'Body',hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  postController.createPost(
                    titleController.text,
                    bodyController.text,
                  );
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  shadowColor: const Color.fromARGB(255, 0, 0, 0),
                  
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
