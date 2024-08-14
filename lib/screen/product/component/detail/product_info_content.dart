import 'package:flutter/material.dart';

class ProductInfoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 이미지 그리드
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2, // 한 줄에 두 개의 이미지를 표시
              crossAxisSpacing: 8.0, // 이미지 간격
              mainAxisSpacing: 8.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // 이 그리드 자체 스크롤 방지
              children: List.generate(4, (index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/home/exhi.png', // 이미지 경로를 여기에 추가
                    fit: BoxFit.cover,
                  ),
                );
              }),
            ),
          ),
          // 설명 텍스트
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '밀크마일(MilkMile)은 유아와 어린이를 위한 의류 브랜드로, 높은 품질과 귀여운 디자인으로 많은 부모들의 사랑을 받고 있습니다. 밀크마일은 신생아부터 유아기까지의 아이들을 위한 다양한 의류 제품을 제공하며, 아이들의 편안함과 안전성을 최우선으로 고려한 제품을 제작합니다.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
