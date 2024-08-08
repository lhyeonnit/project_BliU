import 'package:flutter/material.dart';

class HomeBodyAi extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/home/product1.png',
      'brand': '작은숲길',
      'name': '우이동금손 안나 토션 레이스 베스트',
      'discount': '15%',
      'price': '32,800원',
      'likes': '13,000',
      'comments': '49',
      'liked': false,
    },
    {
      'image': 'assets/images/home/product2.png',
      'brand': '무지개씨앗',
      'name': '우이동금손 바디수트',
      'discount': '10%',
      'price': '53,800원',
      'likes': '13,000',
      'comments': '49',
      'liked': true,
    },
    {
      'image': 'assets/images/home/product3.png',
      'brand': '타이니숍',
      'name': '밀크마일 원 균일가',
      'discount': '15%',
      'price': '23,800원',
      'likes': '13,000',
      'comments': '49',
      'liked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'AI 추천 상품',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 250.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return buildProductCard(products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductCard(Map<String, dynamic> product) {
    return Container(
      width: 200.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                product['image'],
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              if (product['liked'])
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            product['brand'],
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            product['name'],
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.0),
          Text(
            '${product['discount']} ${product['price']}',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.pink,
            ),
          ),
          SizedBox(height: 4.0),
          Row(
            children: [
              Icon(
                Icons.favorite_border,
                size: 14.0,
                color: Colors.grey,
              ),
              SizedBox(width: 4.0),
              Text(
                product['likes'],
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 8.0),
              Icon(
                Icons.comment,
                size: 14.0,
                color: Colors.grey,
              ),
              SizedBox(width: 4.0),
              Text(
                product['comments'],
                style: TextStyle(
                  fontSize: 12.0,
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
