import 'package:get/get.dart';

class CategoryController extends GetxController {
  var selectedCategoryIndex = 0.obs; // 선택된 카테고리 인덱스

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }
}
