import 'package:get/get.dart';
import 'package:homeworkout_flutter/Controllers/home_controller.dart';
import 'package:homeworkout_flutter/Controllers/login_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step1_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step2_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step3_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step4_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step5_controller.dart';
import 'package:homeworkout_flutter/Services/api_basic_info.dart';
import 'package:homeworkout_flutter/Services/api_complete_profile_model.dart';
import 'package:homeworkout_flutter/Services/api_login.dart';
import 'package:homeworkout_flutter/Services/api_more_details.dart';
import 'package:homeworkout_flutter/Services/api_otp.dart';
import 'package:homeworkout_flutter/Services/api_register.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(),fenix: true);
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => Signup2Controller());
    Get.lazyPut(() => Signup3Controller(),fenix: true);
    Get.lazyPut(() => Signup4Controller());
    Get.lazyPut(() => Signup5Controller());
    Get.lazyPut(() => LoginController(),fenix: true);
    Get.lazyPut<ApiLogin>(() => ApiLogin(),fenix: true);
    Get.lazyPut<ApiRegister>(() => ApiRegister(),fenix: true);
    Get.lazyPut<ApiOtp>(() => ApiOtp(),fenix: true);
    Get.lazyPut<ApiBasicInfo>(() => ApiBasicInfo(),fenix: true);
    Get.lazyPut<ApiMoreDetails>(() => ApiMoreDetails(),fenix: true);
    Get.lazyPut<ApiCompleteProfile>(() => ApiCompleteProfile(),fenix: true);
  }
}
