import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeworkout_flutter/Controllers/signup_step1_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step2_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step3_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step4_controller.dart';
import 'package:homeworkout_flutter/Controllers/signup_step5_controller.dart';
import 'package:homeworkout_flutter/View/home.dart';
import 'package:homeworkout_flutter/View/login.dart';
import 'package:homeworkout_flutter/View/signup_step1.dart';
import 'package:homeworkout_flutter/View/signup_step2.dart';
import 'package:homeworkout_flutter/View/signup_step3.dart';
import 'package:homeworkout_flutter/View/signup_step4.dart';
import 'package:homeworkout_flutter/View/signup_step5.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.find<SignupController>();
    final signup2Controller = Get.find<Signup2Controller>();
    final signup3Controller = Get.find<Signup3Controller>();
    final signup4Controller = Get.find<Signup4Controller>();
    final signup5Controller = Get.find<Signup5Controller>();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: PageView(
                controller: signupController.controller,
                onPageChanged: signupController.onPageChanged,
                //  physics: NeverScrollableScrollPhysics(),
                children: const [
                  SignupStep1(),
                  SignupStep2(),
                  SignupStep3(),
                  SignupStep4(),
                  SignupStep5(),
                ],
              ),
            ),
            SmoothPageIndicator(
                controller: signupController.controller,
                count: 5,
                effect: WormEffect(),
                onDotClicked: (index) {
                  // signupController.goToPage(index);
                }),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      minimumSize: Size(320, 40),
                      foregroundColor: Colors.white,
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                      backgroundColor: Colors.deepPurple.shade500),
                  onPressed: () async {
                    if (signupController.currentPage.value == 0) {
                      signupController.nextPage();
                    } else if (signupController.currentPage.value == 1) {
                      if (signup2Controller.key.currentState!.validate()) {
                        await signup2Controller.userRegister();
                      } else {
                        final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                                title: 'Error!',
                                message: "Please fill all fields correctly!",
                                contentType: ContentType.failure));
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      }
                    } else if (signupController.currentPage.value == 2) {
                      if (signup3Controller.isFormValid) {
                        signup3Controller.basicInfo();
                      } else {
                        final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                                title: 'Error!',
                                message: "Please fill all fields correctly!",
                                contentType: ContentType.failure));
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      }
                    } else if (signupController.currentPage.value == 3) {
                      if (signup4Controller.isFormValid) {
                        signup4Controller.moreDetails();
                      } else {
                        final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                                title: 'Error!',
                                message:
                                    "Please select goal and one muscle group at least!",
                                contentType: ContentType.failure));
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      }
                    } else if (signupController.currentPage.value == 4) {
                      if (signup5Controller.isFormValid) {
                        signup5Controller.submitCompleteProfile();
                        if (signup5Controller.sucsess == true) {
                          signup5Controller.sucsess == false;
                          final snackBar = SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                  title: 'success!',
                                  message:
                                      "Your information has been successfully registered!",
                                  contentType: ContentType.success));
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                          Get.to(() => Home());
                        }
                      } else {
                        final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                                title: 'Error!',
                                message:
                                    "Please select a specific level, time and at least one day!",
                                contentType: ContentType.failure));
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      }
                    }
                  },
                  child: Text(signupController.buttonText)),
            ),
            Obx(() {
              if (signupController.currentPage.value == 0) {
                return Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: Row(
                      children: [
                        Text(
                          "Already have an account?",
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => LogIn());
                          },
                          child: Text(
                            " Sign in",
                            style: TextStyle(
                                color: Colors.deepPurple.shade500,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.deepPurple.shade500),
                          ),
                        )
                      ],
                    ));
              } else {
                return SizedBox();
              }
            }),
          ],
        )));
  }
}
