import 'package:e_commerces/modules/home/model/home_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final productsLates = <ProductModel>[].obs;
  final productsPopular = <ProductModel>[].obs;
  final favoriteList = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadProducts();
    _loadPopularProducts();
  }

  /// Latest Products
  void _loadProducts() {
    productsLates.addAll([
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

  /// Popular Products
  void _loadPopularProducts() {
    productsPopular.addAll([
      ProductModel(
        name: "Popular Shoe 1",
        price: 80,
        image: "assets/images/products_popular/IDA000.jpg",
      ),
      ProductModel(
        name: "Popular Shoe 2",
        price: 90,
        image: "assets/images/products_popular/IDH000.jpg",
      ),
      ProductModel(
        name: "Popular Shoe 3",
        price: 100,
        image: "assets/images/products_popular/IDJ000.jpg",
      ),
    ]);
  }

  /// Check favorite
  bool isFavorite(int index) => favoriteList.contains(index);

  /// Toggle favorite
  void toggleFavorite(int index) {
    if (isFavorite(index)) {
      favoriteList.remove(index);
    } else {
      favoriteList.add(index);
    }
  }
}
