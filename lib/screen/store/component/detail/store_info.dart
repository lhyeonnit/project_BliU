import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreInfoPage extends StatelessWidget {
  const StoreInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상단 이미지 부분
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              'assets/images/store/store_detail.png', // 이미지 경로는 실제 경로로 변경
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // 상점 정보 부분
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 브랜드 로고
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/store/brand_logo.png'), // 실제 로고 경로로 변경
                radius: 24,
              ),
              const SizedBox(width: 12),

              // 상점명 및 정보
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '밀크마일',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '캐주얼 (Casual), 키즈(3-8세)',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              // 즐겨찾기 및 아이콘
              Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/product/ic_heart.svg', // 실제 아이콘 경로로 변경
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '1,761',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: SvgPicture.asset('assets/images/product/ic_bookmark.svg'),
                    onPressed: () {
                      // 즐겨찾기 기능 구현
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 설명 텍스트
          const Text(
            '저희 키즈 의류 쇼핑몰은 다양한 스타일과 고품질의 어린이 의류 브랜드들을 자랑합니다. 각 브랜드는 아이들의 편안함과 안전을 최우선으로 생각하며, 트렌디하면서도 실용적인 디자인을 제공합니다. 모든 의류는 친환경 소재로 제작되어 아이들의 민감한 피부에도 심하고 착용할 수 있습니다.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),

          // 쿠폰 다운로드 버튼
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // 쿠폰 다운로드 기능 구현
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                '쿠폰 다운로드',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}