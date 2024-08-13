import 'package:bliu/screen/_component/cart_screen.dart';
import 'package:bliu/screen/_component/search_screen.dart';
import 'package:bliu/screen/home/component/home_body_ai.dart';
import 'package:bliu/screen/home/component/home_body_best_sales.dart';
import 'package:bliu/screen/home/component/home_body_category.dart';
import 'package:bliu/screen/home/component/home_body_exhibition.dart';
import 'package:bliu/screen/home/component/home_footer.dart';
import 'package:bliu/screen/home/component/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../_controller/home/home_controller.dart';


class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final ScrollController _scrollController = ScrollController();

  HomePage({Key? key}) : super(key: key) {
    _scrollController.addListener(() {
      controller.updateScrollPosition(_scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                Obx(() => SliverAppBar(
                  pinned: true,
                  backgroundColor: controller.isScrolled.value
                      ? Colors.white
                      : Colors.transparent,
                  leading: IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/login/ic_back.svg",
                      color: controller.isScrolled.value ? Colors.black : Colors.white,
                    ),
                    onPressed: () {
                      Get.back(); // 뒤로가기 동작을 GetX로 간단하게 처리
                    },
                  ),
                  expandedHeight: 625.0,
                  title: SvgPicture.asset(
                    'assets/images/home/bottom_home.svg', // SVG 파일 경로
                    color: controller.isScrolled.value ? Colors.black : Colors.white,
                    height: 40, // SVG 이미지의 높이 설정
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: HomeHeader(),
                  ),
                  actions: [
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/home/ic_top_sch_w.svg",
                        color: controller.isScrolled.value ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        Get.to(() => SearchScreen());
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/home/ic_smart_w.svg",
                        color: controller.isScrolled.value ? Colors.black : Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/home/ic_cart_w.svg",
                        color: controller.isScrolled.value ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        Get.to(() => CartScreen());
                      },
                    ),
                  ],
                )),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      HomeBodyCategory(),
                      HomeBodyAi(),
                      HomeBodyExhibition(),
                      HomeBodyBestSales(),
                      HomeFooter(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}