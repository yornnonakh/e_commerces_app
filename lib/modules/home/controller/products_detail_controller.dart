import 'package:e_commerces/modules/home/model/products_model.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  var currentIndex = 0.obs;
  var cartList = <ProductModel>[].obs;
  var favoriteList = <ProductModel>[].obs;
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
  void toggleFavorite(ProductModel product) {
    if (favoriteList.contains(product)) {
      favoriteList.remove(product);
    } else {
      favoriteList.add(product);
    }
  }
  bool isFavorite(ProductModel product) {
    return favoriteList.contains(product);
  }
}
