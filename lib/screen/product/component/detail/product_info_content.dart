import 'package:flutter/material.dart';

class ProductInfoContent extends StatefulWidget {
  const ProductInfoContent({super.key});

  @override
  _ProductInfoContentState createState() => _ProductInfoContentState();
}

class _ProductInfoContentState extends State<ProductInfoContent> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 내용 표시 부분
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isExpanded ? null : 700, // 펼쳐지지 않았을 때 높이를 제한
              child: SingleChildScrollView(
                physics: isExpanded ? null : const NeverScrollableScrollPhysics(), // 펼쳐지기 전엔 스크롤 비활성화
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/product/item_dt.png'),
                    const SizedBox(height: 16.0),
                    const Text(
                      "여기에 더 많은 상품 설명이 들어갑니다. 펼쳐진 상태에서 모든 내용을 볼 수 있습니다.",
                    ),
                    const SizedBox(height: 16.0),
                    for (int i = 0; i < 20; i++) // 더 많은 텍스트를 추가하여 스크롤 가능하게 함
                      const Text(
                        "더 많은 설명 내용...",
                        style: TextStyle(fontSize: 16),
                      ),
                  ],
                ),
              ),
            ),
            // 상품 정보 펼쳐보기 버튼
            if (!isExpanded)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = true; // 펼쳐보기 버튼 클릭 시 스크롤 활성화
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "상품 정보 펼쳐보기",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            if (isExpanded)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = false; // 다시 접기
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "상품 정보 접기",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
