import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../_controller/home/home_header_controller.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeHeaderController controller = Get.put(HomeHeaderController());

    return Stack(
      children: [
        PageView(
          controller: controller.pageController,
          children: [
            buildPage(
              imagePath: 'assets/images/home/main_bn01.png',
              title: '아이들을 위한',
              subtitle: '스타일리시한 선택!',
              description: '특별한 시간을 오래오래 함께하고 하고싶은',
            ),
            buildPage(
              imagePath: 'assets/images/home/main_bn02.png',
              title: '새로운 스타일',
              subtitle: '모두가 주목하는!',
              description: '아이들의 특별한 순간을 위해',
            ),
          ],
        ),
        Positioned(
          bottom: 115.0,
          left: 0,
          right: 327,
          child: Center(
            child: Obx(() => SmoothPageIndicator(
              controller: controller.pageController,
              count: controller.totalPages,
              effect: WormEffect(
                dotWidth: 6.0,
                dotHeight: 6.0,
                activeDotColor: Colors.white,
                dotColor: Colors.grey,
              ),
            )),
          ),
        ),
      ],
    );
  }

  Widget buildPage({
    required String imagePath,
    required String title,
    required String subtitle,
    required String description,
  }) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 625.0,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover, // 이미지를 전체 화면에 맞추고 가로 여백 없이 설정
          ),
        ),
        Positioned(
          bottom: 140.8,
          left: 16.0,
          right: 20.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
