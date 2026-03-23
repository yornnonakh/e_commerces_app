import 'package:e_commerces/modules/home/model/products_model.dart';
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

  // Object? isFavorite(ProductModel product) {}

  void toggleFavorite(ProductModel product) {}
}
