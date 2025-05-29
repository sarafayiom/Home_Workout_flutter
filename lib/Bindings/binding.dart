import 'package:get/get.dart';
import 'package:homeworkout_flutter/Controllers/home_controller.dart';
import 'package:homeworkout_flutter/Controllers/login_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step1_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step2_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step3_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step4_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step5_controller.dart';
import 'package:homeworkout_flutter/Controllers/startupscreen_controller.dart';
import 'package:homeworkout_flutter/Services/api_basic_info.dart';
import 'package:homeworkout_flutter/Services/api_complete_profile_model.dart';
import 'package:homeworkout_flutter/Services/api_login.dart';
import 'package:homeworkout_flutter/Services/api_more_details.dart';
import 'package:homeworkout_flutter/Services/api_otp.dart';
import 'package:homeworkout_flutter/Services/api_register.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => Signup2Controller());
    Get.lazyPut(() => Signup3Controller());
    Get.lazyPut(() => Signup4Controller());
    Get.lazyPut(() => Signup5Controller());
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut<ApiLogin>(() => ApiLogin());
    Get.lazyPut<ApiRegister>(() => ApiRegister());
    Get.lazyPut<ApiOtp>(() => ApiOtp());
    Get.lazyPut<ApiBasicInfo>(() => ApiBasicInfo());
    Get.lazyPut<ApiMoreDetails>(() => ApiMoreDetails());
    Get.lazyPut<ApiCompleteProfile>(() => ApiCompleteProfile());
  }
}
