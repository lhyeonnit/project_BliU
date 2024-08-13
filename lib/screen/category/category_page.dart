import 'package:bliu/screen/product/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../_controller/category/category_controller.dart';
import 'dummy/category.dart';


class CategoryPage extends StatelessWidget {
  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('카테고리'),
      ),
      body: Row(
        children: [
          // 왼쪽 상위 카테고리 목록
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Obx(() => ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categories[index]['ct_name']!),
                  selected: index == controller.selectedCategoryIndex.value,
                  onTap: () {
                    controller.selectCategory(index);
                  },
                );
              },
            )),
          ),
          // 오른쪽 모든 상위 + 하위 카테고리 목록을 나열
          Expanded(
            child: Obx(() {
              final selectedCategory = categories[controller.selectedCategoryIndex.value];
              return ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 상위 카테고리 제목과 이미지
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            SvgPicture.network(
                              selectedCategory['img']!,
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(width: 10),
                            Text(
                              selectedCategory['ct_name']!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 하위 카테고리 목록
                      ...subCategories[int.parse(selectedCategory['ct_idx']!)]!
                          .map((subCategory) => ListTile(
                        title: Text(subCategory),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // 하위 카테고리 선택 시 처리
                          Get.to(() => ProductListScreen());
                        },
                      ))
                          .toList(),
                      Divider(), // 상위 카테고리 구분을 위한 구분선
                    ],
                  )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
