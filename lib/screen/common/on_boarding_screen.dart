import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../_controller/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  final OnBoardingController controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onBackPressed,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 66,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: controller.pageController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        String imagePath = '';
                        switch (index) {
                          case 0:
                            imagePath = 'assets/images/onbImg01.png';
                            break;
                          case 1:
                            imagePath = 'assets/images/onbImg02.png';
                            break;
                          case 2:
                            imagePath = 'assets/images/onbImg03.png';
                            break;
                        }
                        return Container(
                          color: Colors.white, // 배경색을 흰색으로 설정
                          child: Align(
                            alignment: Alignment.topCenter, // 상단 중앙에 맞추기
                            child: Image.asset(
                              imagePath,
                              width: 412,
                              height: 660,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 412,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: SmoothPageIndicator(
                              controller: controller.pageController,
                              count: 3,
                              effect: const ScrollingDotsEffect(
                                activeDotColor: Colors.indigoAccent,
                                activeStrokeWidth: 10,
                                activeDotScale: 1.5,
                                maxVisibleDots: 5,
                                radius: 8,
                                spacing: 10,
                                dotHeight: 4,
                                dotWidth: 4,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          alignment: Alignment.topRight,
                          height: 58,
                          child: SizedBox(
                            child: InkWell(
                              onTap: controller.onSkipOrNext,
                              child: Container(
                                width: 88,
                                height: 38,
                                margin: const EdgeInsets.only(right: 16),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xffDDDDDD),
                                  ),
                                ),
                                child: Obx(
                                      () => Text(
                                    controller.currentPage.value == 2
                                        ? "다음"
                                        : "건너뛰기",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}