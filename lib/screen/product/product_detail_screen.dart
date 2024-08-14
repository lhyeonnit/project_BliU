//상품 상세
import 'package:bliu/screen/product/component/detail/product_ai.dart';
import 'package:bliu/screen/product/component/detail/product_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../_component/cart_screen.dart';
import '../_component/search_screen.dart';
import 'component/detail/product_banner.dart';
import 'component/detail/product_info_before_order.dart';
import 'component/detail/product_info_title.dart';
import 'component/detail/product_inquiry.dart';



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
                MaterialPageRoute(builder: (context) => SearchScreen()),
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
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
              ),
              Positioned(
                right: 4,
                top: 20,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
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
          ProductBanner(), // 배너 위젯 추가
          ProductInfoTitle(), // 타이틀 위젯 추가
          ProductBody(), // 제품 정보 및 리뷰 위젯 추가
          ProductAi(), // AI 관련 위젯 추가
          ProductInfoBeforeOrder(), // 주문 전 정보 위젯 추가
          ProductInquiry(), // 문의 위젯 추가
        ],
      ),
    );
  }
}

