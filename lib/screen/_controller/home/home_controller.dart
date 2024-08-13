import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isScrolled = false.obs;  // 상태를 반응형으로 관리

  void updateScrollPosition(ScrollController scrollController) {
    if (scrollController.offset > 50 && !isScrolled.value) {
      isScrolled.value = true;
    } else if (scrollController.offset <= 50 && isScrolled.value) {
      isScrolled.value = false;
    }
  }
}