import 'package:get/get.dart';

class ExhibitionController extends GetxController {
  var cartItemCount = 2.obs;

  void incrementCart() {
    cartItemCount++;
  }

  void decrementCart() {
    if (cartItemCount > 0) {
      cartItemCount--;
    }
  }
}
