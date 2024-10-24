import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/pages/homepage.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'images/logo.png',
                color: Colors.white, 
                height: 250,
                width: 250,
              ),
              
            ],
          ),
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () => Get.to(() => HomeScreen()),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        child: Icon(Icons.keyboard_arrow_right, color: const Color.fromARGB(255, 255, 255, 255),size: 50, ),),

    );
  }
}
