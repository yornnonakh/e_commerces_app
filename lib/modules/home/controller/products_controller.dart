import 'package:e_commerces/modules/home/model/products_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final productsLatest = <ProductModel>[].obs;
  final productsPopular = <ProductModel>[].obs;
  final favoriteProducts = <ProductModel>[].obs;
  final cartList = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadProducts();
    _loadPopularProducts();
  }

  void _loadProducts() {
    productsLatest.addAll([
      ProductModel(
        name: "Shoe 1",
        price: 50,
        image: "assets/images/products_latest/IDC001.jpg",
        images: [
          "assets/images/products_latest/IDC001.jpg",
          "assets/images/products_latest/IDC002.jpg",
          "assets/images/products_latest/IDC003.jpg",
        ],
      ),
      // Add more products
    ]);
  }

  void _loadPopularProducts() {
    productsPopular.addAll([
      ProductModel(
        name: "Popular Shoe 1",
        price: 80,
        image: "assets/images/products_popular/IDA000.jpg",
        images: [
          "assets/images/products_popular/IDA000.jpg",
          "assets/images/products_popular/IDA001.jpg",
        ],
      ),
      // Add more products
    ]);
  }

  void toggleFavorite(ProductModel product) {
  if (favoriteProducts.contains(product)) {
    favoriteProducts.remove(product);
  } else {
    favoriteProducts.add(product);
  }
}

void addToCart(ProductModel product) => cartList.add(product);

  bool isFavorite(ProductModel product) => favoriteProducts.contains(product);
  
}