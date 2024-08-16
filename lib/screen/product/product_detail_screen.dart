import 'package:bliu/screen/product/component/detail/product_info_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../_component/cart_screen.dart';
import '../_component/search_screen.dart';
import 'component/detail/product_ai.dart';
import 'component/detail/product_banner.dart';
import 'component/detail/product_info_before_order.dart';
import 'component/detail/product_info_title.dart';
import 'component/detail/product_inquiry.dart';
import 'component/detail/product_review.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset("assets/images/product/ic_back.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/images/product/ic_top_sch.svg"),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SearchScreen()),
              );
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: SvgPicture.asset("assets/images/product/ic_cart.svg"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  CartScreen()),
                  );
                },
              ),
              Positioned(
                right: 4,
                top: 20,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.pinkAccent,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          ProductBanner(),
          ProductInfoTitle(),
          const DefaultTabController(
            length: 2, // 두 개의 탭
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: '상세정보'),
                    Tab(text: '리뷰(10)'),
                  ],
                ),
                SizedBox(
                  height: 800, // TabBarView가 차지하는 공간을 고정
                  child: TabBarView(
                    children: [
                      // 상품 내용 정보
                      ProductInfoContent(),
                      // 상품 리뷰
                      ProductReview(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 탭 아래에 추가되는 정보들
          ProductAi(),
          ProductInfoBeforeOrder(),
          ProductInquiry(),
        ],
      ),
    );
  }
}
