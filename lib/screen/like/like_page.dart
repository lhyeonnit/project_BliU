// like_page.dart

import 'package:flutter/material.dart';

import 'dummy/like.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  String selectedCategory = '전체';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('좋아요'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            height: 50.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = categories[index];
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: selectedCategory == categories[index]
                                ? Colors.black
                                : Colors.grey,
                            fontWeight: selectedCategory == categories[index]
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        if (selectedCategory == categories[index])
                          Container(
                            margin: EdgeInsets.only(top: 4.0),
                            height: 2.0,
                            width: 20.0,
                            color: Colors.black,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '상품 128,123',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    // 정렬방식 선택하는 액션 추가
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.7,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return buildItemCard(items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemCard(Map<String, String> item) {
    return Container(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: Image.network(
              item['image']!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[200],
                  child: Center(
                    child: Text(
                      'Image not available',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
          ),
        Text(
              item['brand']!,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // 길이가 길면 생략
            ),
          Text(
            item['name']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
            overflow: TextOverflow.ellipsis, // 길이가 길면 생략
          ),
          Text(
            '${item['discount']} ${item['price']}',
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.grey,
                size: 16.0,
              ),
              SizedBox(width: 4.0),
              Text(item['likes']!),
              SizedBox(width: 16.0),
              Icon(
                Icons.chat_bubble,
                color: Colors.grey,
                size: 16.0,
              ),
              SizedBox(width: 4.0),
              Text(item['comments']!),
            ],
          ),
        ],
      )
    );
  }
}