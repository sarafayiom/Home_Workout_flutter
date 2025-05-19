import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homeworkout_flutter/View/signup..dart';

class HomeController extends GetxController {
  final box = GetStorage();

  void logout() {
    box.remove('access_token'); 
    box.remove('refresh_token'); 
    Get.offAll(() => SignUp()); 
  }
}