import 'package:flutter/material.dart';
import '../exhibition_screen.dart';

class HomeBodyExhibition extends StatelessWidget {
  final List<Map<String, dynamic>> exhibitions = [
    {
      'image': 'assets/images/home/exhi.png',
      'title': '우리 아이를 위한 포근한 선택',
      'subtitle': '집에서도 스타일리시하게!\n우리 아이를 위한 홈웨어 컬렉션.',
    },
    {
      'image': 'assets/images/home/exhi.png',
      'title': '새로운 스타일',
      'subtitle': '모두가 주목하는!\n아이들의 특별한 순간을 위해.',
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
              return buildExhibitionCard(context, exhibitions[index]);
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

  Widget buildExhibitionCard(BuildContext context, Map<String, dynamic> exhibition) {
    return Container(
      width: 400.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                exhibition['image'],
                width: 350.0,
                height: 350.0,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              // 제목 및 부제목 텍스트
              Positioned(
                bottom: 110.0,
                left: 16.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exhibition['title']!,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      exhibition['subtitle']!,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // 작은 이미지 또는 아이콘
              Positioned(
                bottom: 7.0,
                left: 16.0,
                child: Row(
                  children: [
                    // 작은 이미지들
                    Image.asset(
                      'assets/images/home/exhi.png',
                      width: 80.0,
                      height: 80.0,
                    ),
                    SizedBox(width: 8.0),
                    Image.asset(
                      'assets/images/home/exhi.png',
                      width: 80.0,
                      height: 80.0,
                    ),
                    SizedBox(width: 8.0),
                    Image.asset(
                      'assets/images/home/exhi.png',
                      width: 80.0,
                      height: 80.0,
                    ),
                    SizedBox(width: 16.0),
                    // 원형 버튼 및 자세히 보기 버튼
                    Column(
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: TextButton(
                              child: Text(
                                '+35',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                // ExhibitionScreen으로 네비게이션
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExhibitionScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          width: 80.0,
                          child: TextButton(
                            child: Text(
                              '자세히보기',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              // ExhibitionScreen으로 네비게이션
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExhibitionScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
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
