import 'package:flutter/material.dart';
import 'home_body_best_sales_category.dart';

class HomeBodyBestSales extends StatefulWidget {
  const HomeBodyBestSales({super.key});

  @override
  State<HomeBodyBestSales> createState() => _HomeBodyBestSalesState();
}

class _HomeBodyBestSalesState extends State<HomeBodyBestSales> {
  String sortOrder = '최신순';

  void _onSortOrderChanged() {
    setState(() {
      sortOrder = sortOrder == '최신순' ? '인기순' : '최신순';
    });
  }

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
        HomeBodyBestSalesCategory(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _onSortOrderChanged,
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
      ],
    );
  }
}