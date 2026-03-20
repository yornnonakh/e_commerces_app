import 'package:e_commerces/modules/home/model/home_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // Initialize with empty list to avoid null
  var products = <ProductModel>[].obs;
  var favoriteList = <int>[].obs;

  get isFavorite => null;

  @override
  void onInit() {
    super.onInit();
    // Example: load some dummy products
    products.addAll([
      ProductModel(
        name: "Shoe 1",
        price: 50,
        image: "assets/images/products_latest/IDC001.jpg",
      ),
      ProductModel(
        name: "Shoe 2",
        price: 60,
        image: "assets/images/products_latest/IDE000.jpg",
      ),
      ProductModel(
        name: "Shoe 3",
        price: 70,
        image: "assets/images/products_latest/IDG000.jpg",
      ),
    ]);
  }

  void toggleFavorite(int index) {
    if (favoriteList.contains(index)) {
      favoriteList.remove(index);
    } else {
      favoriteList.add(index);
    }
  }
}
