import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBodyExhibition extends StatelessWidget {
  final List<Map<String, dynamic>> exhibitions = [
    {
      'image': 'assets/images/home/exhi.png',
      'title': '우리 아이를 위한 포근한 선택',
      'description': '집에서도 스타일리시하게!\n우리 아이를 위한 홈웨어 컬렉션.',
      'thumbnail': 'assets/images/home/exhi.png',
    },
    {
      'image': 'assets/images/home/exhi.png',
      'title': '새로운 스타일',
      'description': '모두가 주목하는!\n아이들의 특별한 순간을 위해.',
      'thumbnail': 'assets/images/home/exhi.png',
    },
    // 추가적인 항목들을 여기에 추가하세요.
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 350.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: exhibitions.length,
            itemBuilder: (context, index) {
              return buildExhibitionCard(exhibitions[index]);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: DotsIndicator(
            dotsCount: exhibitions.length,
          ),
        ),
      ],
    );
  }

  Widget buildExhibitionCard(Map<String, dynamic> exhibition) {
    return Container(
      width: 300.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                exhibition['image'],
                width: 100.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
                child: Text(
                  exhibition['title'],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            exhibition['description'],
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Image.asset(
                exhibition['thumbnail'],
                width: 60.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 8.0),
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.white,
                child: Text(
                  '+35',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Text(
                '자세히보기',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DotsIndicator extends StatelessWidget {
  final int dotsCount;

  const DotsIndicator({required this.dotsCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotsCount, (index) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
        );
      }),
    );
  }
}
