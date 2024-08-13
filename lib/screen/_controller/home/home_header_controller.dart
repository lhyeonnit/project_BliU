import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeaderController extends GetxController {
  final PageController pageController = PageController();
  Timer? timer;
  var currentPage = 0.obs;
  final int totalPages = 2;

  @override
  void onInit() {
    super.onInit();
    startAutoScroll();
  }

  void startAutoScroll() {
    timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage.value < totalPages - 1) {
        currentPage.value++;
      } else {
        currentPage.value = 0;
      }

      pageController.animateToPage(
        currentPage.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
