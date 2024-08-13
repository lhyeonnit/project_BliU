import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../category/category_page.dart';
import '../home/home_page.dart';
import '../like/like_page.dart';
import '../mypage/my_page.dart';
import '../store/store_page.dart';

class MainPageController extends GetxController {
  var selectedIndex = 2.obs; // Observable for selected index
  DateTime? backButtonPressedTime;

  final List<Widget> widgetOptions = <Widget>[
    StorePage(),
    LikePage(),
    HomePage(),
    CategoryPage(),
    MyPage(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();

    bool backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressedTime == null ||
            currentTime.difference(backButtonPressedTime!) > const Duration(seconds: 3);

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressedTime = currentTime;
      Get.snackbar(
        "뒤로 가기",
        "한번 더 뒤로가기를 누르면 종료됩니다.",
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
      return Future.value(false);
    }

    return Future.value(true);
  }
}