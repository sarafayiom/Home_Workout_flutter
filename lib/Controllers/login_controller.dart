import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homeworkout_flutter/Helpers/loading_helper.dart';
import 'package:homeworkout_flutter/Models/user_login_model.dart';
import 'package:homeworkout_flutter/Services/api_login.dart';
import 'package:homeworkout_flutter/View/home.dart';

class LoginController extends GetxController {
  var logingfirsttime = false;
  final userEmailController = TextEditingController();
  final passwordController = TextEditingController();
  ApiLogin api = Get.find();
  final key = GlobalKey<FormState>();
  final RxBool button = false.obs;
  Widget smartquotestype(bool thisbutton) {
    if (thisbutton == true) {
      return IconButton(
          onPressed: () {
            button.value = false;
          },
          icon: Icon(Icons.visibility_off));
    } else {
      return IconButton(
          onPressed: () {
            button.value = true;
          },
          icon: Icon(Icons.visibility));
    }
  }

  SmartQuotesType isSmart() {
    return button.value ? SmartQuotesType.enabled : SmartQuotesType.disabled;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    return null;
  }

  Future<void> login(String email, String password) async {
    final user = UserLoginModel(
      email: email,
      password: password,
    );

    LoadingHelper.show();

    try {
      final response = await api.loginuser(user);

      LoadingHelper.hide();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.body;

        String token = data['access'];
        String refreshToken = data['refresh'];

        final box = GetStorage();
        box.write('access_token', token);
        box.write('refresh_token', refreshToken);
        // ignore: avoid_print
        print(token);
       Get.snackbar('Success', 'Logged in successfully');
        if (logingfirsttime == true) {
          logingfirsttime = false;
        } else {
          Get.offAll(() => Home());
        }
      } else {
        Get.snackbar("Error", "Login failed: ${response.body.toString()}");
      }
    } catch (e) {
      LoadingHelper.hide();
      Get.snackbar('Error', 'Something went wrong! $e');
    }
  }
  @override
void onClose() {
  userEmailController.dispose();
  passwordController.dispose();
  super.onClose();
}
}
