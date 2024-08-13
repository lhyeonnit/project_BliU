import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../main_page.dart';

class OnBoardingController extends GetxController {
  var currentPage = 0.obs;
  final PageController pageController = PageController();
  DateTime? backButtonPressedTime;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentPage.value = pageController.page?.round() ?? 0;
    });
  }

  Future<bool> onBackPressed() async {
    if (Platform.isAndroid) {
      DateTime currentTime = DateTime.now();

      bool backButton = backButtonPressedTime == null ||
          currentTime.difference(backButtonPressedTime!) > const Duration(seconds: 3);

      if (backButton) {
        backButtonPressedTime = currentTime;
        Get.snackbar(
          "뒤로 가기",
          "한번 더 뒤로가기를 누를 시 종료됩니다",
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
        );
        return Future.value(false); // 이전 화면으로 돌아가지 않음
      }

      return Future.value(true); // 앱을 종료
    }

    return Future.value(true); // 다른 플랫폼에서는 항상 true 반환
  }

  void onSkipOrNext() {
    Get.off(() => MainPage()); // 항상 MainPage로 이동
  }
}