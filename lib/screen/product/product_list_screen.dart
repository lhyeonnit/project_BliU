import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bliu/screen/_component/cart_screen.dart';
import 'package:bliu/screen/_component/search_screen.dart';
import 'component/product_category_bottom.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedCategory = '아우터';

  String selectedAgeOption = '';
  String selectedStyleOption = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _openCategoryBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ProductCategoryBottom(
          onCategorySelected: (category) {
            setState(() {
              _selectedCategory = category;
            });
            Navigator.pop(context); // Close the bottom sheet
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: SvgPicture.asset("assets/images/product/ic_back.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: InkWell(
          onTap: _openCategoryBottomSheet, // Open the bottom sheet on tap
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _selectedCategory,
                style: TextStyle(color: Colors.black),
              ),
              Icon(Icons.expand_more, color: Colors.black),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/images/product/ic_top_sch.svg"),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: SvgPicture.asset("assets/images/product/ic_cart.svg"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
              ),
              Positioned(
                right: 4,
                top: 20,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.black,
          tabs: [
            Tab(text: '전체'),
            Tab(text: '자켓'),
            Tab(text: '가디건/베스트'),
            Tab(text: '코트'),
            Tab(text: '후드집업'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Adding the filter and product count UI
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.swap_vert, size: 20),
                    SizedBox(width: 4),
                    Text(
                      '최신순',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 버튼 간격 조정
                  children: [
                    _buildFilterButton(context, '연령'),
                    _buildFilterButton(context, '스타일'),
                    _buildFilterButton(context, '가격'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '상품 128,123',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                // The rest of your TabBarView or other content goes here
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Center(child: Text('전체 상품 수: 128,123')),
                      Center(child: Text('자켓')),
                      Center(child: Text('가디건/베스트')),
                      Center(child: Text('코트')),
                      Center(child: Text('후드집업')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context, String label) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // 둥근 모서리
        ),
        side: BorderSide(
          color: Colors.grey, // 테두리 색상
        ),
        padding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0), // 패딩 조정
      ),
      onPressed: () {
        // 버튼 클릭 시 실행될 코드
      },
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.black), // 텍스트 색상
          ),
          Icon(
            Icons.arrow_drop_down, // 드롭다운 아이콘
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
