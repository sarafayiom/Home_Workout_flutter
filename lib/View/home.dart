import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeworkout_flutter/Controllers/home_controller.dart';

class Home extends StatefulWidget {
  final homeController = Get.find<HomeController>();
  Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
               widget.homeController.logout();
              },
              child: Text("Logout"))
        ],
      ),
    );
  }
}
