import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  PageController controller = PageController();
  RxInt currentPage = 0.obs;

  void goToPage(int index) {
    controller.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
  final currentPage = controller.hasClients ? controller.page?.toInt() : null;

  if (currentPage != null && currentPage < 4) {
    goToPage(currentPage + 1);
  }
}
void previousPage() {
  if (controller.page! > 0) {
    controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    currentPage.value = controller.page!.toInt() - 1;
  }
}

  String get buttonText {
    switch (currentPage.value) {
      case 0:
        return "Get Started";
      case 4:
        return "Done";
      default:
        return "Next";
    }
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
