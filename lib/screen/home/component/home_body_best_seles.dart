import 'package:flutter/material.dart';

class HomeBodyBestSeles extends StatefulWidget {
  @override
  _HomeBodyBestSelesState createState() => _HomeBodyBestSelesState();
}

class _HomeBodyBestSelesState extends State<HomeBodyBestSeles> {
  final List<String> categories = [
    '전체', '아우터', '상의', '하의', '원피스', '슈즈'
  ];
  int selectedCategoryIndex = 0;
  String sortOrder = '최신순';
  String filter = '연령';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '판매베스트',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 50.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ChoiceChip(
                  label: Text(categories[index]),
                  selected: selectedCategoryIndex == index,
                  onSelected: (selected) {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  selectedColor: Colors.pink[100],
                  labelStyle: TextStyle(
                    color: selectedCategoryIndex == index ? Colors.pink : Colors.black,
                  ),
                  backgroundColor: Colors.grey[200],
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: selectedCategoryIndex == index ? Colors.pink : Colors.grey[300]!,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    sortOrder = sortOrder == '최신순' ? '인기순' : '최신순';
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.sort, size: 20.0),
                    SizedBox(width: 4.0),
                    Text(sortOrder),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text('정렬 방식'),
                    Icon(Icons.arrow_drop_down, size: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
        // 아래의 Expanded와 GridView.builder 부분은 임시로 주석 처리했습니다.
        // 필요에 따라 활성화하세요.
        /*
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.7,
              ),
              itemCount: 4, // 예시를 위한 아이템 개수
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/home/product1.png', // 예시 이미지 경로
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 8.0,
                            right: 8.0,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '꿈꾸는데이지',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '꿈꾸는데이지 안나 토션 레이스 베스트',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '15% 32,800원',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.pink,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.favorite, size: 14.0, color: Colors.grey),
                            SizedBox(width: 4.0),
                            Text('13,000', style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.chat_bubble, size: 14.0, color: Colors.grey),
                            SizedBox(width: 4.0),
                            Text('49', style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        */
      ],
    );
  }
}
