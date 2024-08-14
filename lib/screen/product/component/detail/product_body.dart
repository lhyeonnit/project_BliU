
//제품 정보 및 리뷰
import 'package:flutter/material.dart';

import 'product_info_content.dart';
import 'product_review.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 두 개의 탭
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Product Detail',
            style: TextStyle(color: Colors.black),
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: '상품 정보'),
              Tab(text: '리뷰'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductInfoContent(), // 상품 정보 탭의 내용
            ProductReview(), // 리뷰 탭의 내용
          ],
        ),
      ),
    );
  }
}