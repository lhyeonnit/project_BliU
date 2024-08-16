import 'package:bliu/screen/store/store_detail_screen.dart';
import 'package:flutter/material.dart';
import '../../home/component/home_body_best_sales_category.dart';
import '../dummy/store_favorie.dart';
import '../dummy/store_favorite_product.dart';

class StoreFavoriePage extends StatefulWidget {
  const StoreFavoriePage({super.key});

  @override
  _StoreFavoritePageState createState() => _StoreFavoritePageState();
}

class _StoreFavoritePageState extends State<StoreFavoriePage> {
  final int itemsPerPage = 5;
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final int totalPages = (favoriteStores.length / itemsPerPage).ceil();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '즐겨찾기 ${favoriteStores.length}',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView( // 전체 페이지를 스크롤 가능하게 감쌈
        child: Column(
          children: [
            Container(
              height: 360, // 즐겨찾기 항목의 고정된 높이
              child: PageView.builder(
                controller: _pageController,
                itemCount: totalPages,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                itemBuilder: (context, pageIndex) {
                  final startIndex = pageIndex * itemsPerPage;
                  final endIndex = startIndex + itemsPerPage;
                  final displayedStores = favoriteStores.sublist(
                    startIndex,
                    endIndex > favoriteStores.length
                        ? favoriteStores.length
                        : endIndex,
                  );

                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: displayedStores.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(displayedStores[index]['logo']!),
                        ),
                        title: Text(displayedStores[index]['name']!),
                        subtitle: Text(displayedStores[index]['description']!),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bookmark, color: Colors.pink),
                            Text(displayedStores[index]['scrapCount']!),
                          ],
                        ),
                        onTap: () {
                          // Navigate to store_detail page when item is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StoreDetailScreen(),
                          )
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(totalPages, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: currentPage == index ? 8.0 : 5.0,
                    height: currentPage == index ? 8.0 : 5.0,
                    decoration: BoxDecoration(
                      color: currentPage == index ? Colors.black : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '즐겨찾기한 스토어 상품 검색',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            HomeBodyBestSalesCategory(),
            GridView.builder(
              shrinkWrap: true,
              // 부모의 크기에 따라 크기를 결정
              physics: NeverScrollableScrollPhysics(),
              // 그리드 뷰 자체의 스크롤 비활성화
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.7,
              ),
              itemCount: storeFavoriteProduct.length,
              // storeFavoriteProduct 리스트의 항목 개수
              itemBuilder: (context, index) {
                final product = storeFavoriteProduct[index];
                return Container(
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1.0,
                          child: Image.asset(
                            product['image']!,
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
                          product['brand']!,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis, // 길이가 길면 생략
                        ),
                        Text(
                          product['name']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          overflow: TextOverflow.ellipsis, // 길이가 길면 생략
                        ),
                        Text(
                          '${product['discount']} ${product['price']}',
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
                            Text(product['likes']!),
                            SizedBox(width: 16.0),
                            Icon(
                              Icons.chat_bubble,
                              color: Colors.grey,
                              size: 16.0,
                            ),
                            SizedBox(width: 4.0),
                            Text(product['comments']!),
                          ],
                        ),
                      ],
                    )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}