//상품 리스트
import 'package:bliu/screen/_component/cart_screen.dart';
import 'package:bliu/screen/_component/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _sortOption = '최신순';
  String _ageFilter = '연령';
  String _styleFilter = '스타일';
  String _priceFilter = '가격';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // 여기서 초기화합니다.
  }

  @override
  void dispose() {
    _tabController.dispose(); // TabController를 해제합니다.
    super.dispose();
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
            Navigator.pop(context); // 뒤로가기 동작
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '아우터',
              style: TextStyle(color: Colors.black),
            ),
            Icon(Icons.expand_more, color: Colors.black), // 드롭다운 아이콘
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/images/product/ic_top_sch.svg"),
            color: Colors.black,
            onPressed: () {
              // 검색 화면으로 이동
              Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => SearchScreen(),
              ),
              );
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: SvgPicture.asset("assets/images/product/ic_cart.svg"),
                onPressed: () {
                  // 장바구니 화면으로 이동
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => CartScreen(),
                  ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: _sortOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      _sortOption = newValue!;
                    });
                  },
                  items: <String>['최신순', '인기순', '할인순']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: _ageFilter,
                  onChanged: (String? newValue) {
                    setState(() {
                      _ageFilter = newValue!;
                    });
                  },
                  items: <String>['연령', '아동', '성인']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: _styleFilter,
                  onChanged: (String? newValue) {
                    setState(() {
                      _styleFilter = newValue!;
                    });
                  },
                  items: <String>['스타일', '캐주얼', '포멀']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: _priceFilter,
                  onChanged: (String? newValue) {
                    setState(() {
                      _priceFilter = newValue!;
                    });
                  },
                  items: <String>['가격', '낮은 가격', '높은 가격']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('상품 128,123'),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: 10, // 예시 아이템 수
              itemBuilder: (context, index) {
                return _buildProductItem();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage('assets/images/exhibition/exhibition_img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          '꿈꾸는데이지 안나 토션 레이스 베스트',
          style: TextStyle(fontSize: 14.0, color: Colors.black),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4.0),
        Text(
          '15% 32,800원',
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.0),
        Row(
          children: [
            Icon(Icons.favorite_border, size: 16.0, color: Colors.grey),
            SizedBox(width: 4.0),
            Text('13,000', style: TextStyle(fontSize: 12.0, color: Colors.grey)),
            SizedBox(width: 16.0),
            Icon(Icons.chat_bubble_outline, size: 16.0, color: Colors.grey),
            SizedBox(width: 4.0),
            Text('49', style: TextStyle(fontSize: 12.0, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}