import 'package:get/get.dart';

class LikeController extends GetxController {
  var selectedCategory = '전체'.obs;

  void updateCategory(String category) {
    selectedCategory.value = category;
  }
}
