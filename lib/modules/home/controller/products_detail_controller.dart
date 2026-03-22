import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  var currentIndex = 0.obs;

  void nextImage(int length) {
    if (length == 0) return;
    currentIndex.value = (currentIndex.value + 1) % length;
  }

  void previousImage(int length) {
    if (length == 0) return;
    currentIndex.value = (currentIndex.value - 1 + length) % length;
  }

  @override
  void onClose() {
    currentIndex.value = 0;
    super.onClose();
  }
}
