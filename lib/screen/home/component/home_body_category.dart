import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBodyCategory extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': '카테고리', 'icon': 'assets/images/home/cate_ic_store.svg'},
    {'name': '아우터', 'icon': 'assets/images/home/cate_ic01.svg'},
    {'name': '상의', 'icon': 'assets/images/home/cate_ic02.svg'},
    {'name': '하의', 'icon': 'assets/images/home/cate_ic03.svg'},
    {'name': '원피스', 'icon': 'assets/images/home/cate_ic07.svg'},
    {'name': '슈즈', 'icon': 'assets/images/home/cate_ic08.svg'},
    {'name': '세트/한벌옷', 'icon': 'assets/images/home/cate_ic04.svg'},
    {'name': '언더웨어/홈웨어', 'icon': 'assets/images/home/cate_ic05.svg'},
    {'name': '악세서리', 'icon': 'assets/images/home/cate_ic06.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      padding: EdgeInsets.only(left: 16.0, top: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSpecialCategory = category['icon'] == 'assets/images/home/cate_ic_store.svg';

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                isSpecialCategory
                    ? CircleAvatar(
                  radius: 35.0,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    category['icon']!,
                    width: 70.0,
                    height: 70.0,
                  ),
                )
                    : Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFFEFEFEF), // 테두리 색상
                      width: 1.0,
                    ),
                  ),
                    child: SvgPicture.asset(
                      category['icon']!,
                      width: 70.0,
                      height: 70.0,
                    ),
                  ),
                SizedBox(height: 5.0),
                Text(
                  category['name']!,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
