import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '_component/custom_bottom_navigation_bar.dart';
import '_controller/main_page_controller.dart';

class MainPage extends StatelessWidget {
  final MainPageController controller = Get.put(MainPageController(), permanent: true); // permanent로 Controller 유지

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Scaffold(
        body: Obx(() => controller.widgetOptions[controller.selectedIndex.value]),
        bottomNavigationBar: Obx(
              () => CustomBottomNavigationBar(
            selectedIndex: controller.selectedIndex.value,
            onItemTapped: controller.onItemTapped,
          ),
        ),
      ),
    );
  }
}
