import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homeworkout_flutter/View/home.dart';
import 'package:homeworkout_flutter/View/signup..dart';

class SplashController extends GetxController {
  Rx waiting = true.obs;
   final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 4), () {
      waiting.value = false;
     if (box.hasData('access_token')) {
        Get.off(() => Home());
      } else {
        Get.off(() => SignUp());
      }
    });
  }
    }
