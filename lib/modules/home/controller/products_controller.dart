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
        image: "assets/images/products_latest/IDE000.jpg",
        images: [
          "assets/images/products_latest/IDE000.jpg",
          "assets/images/products_latest/IDE001.jpg",
          "assets/images/products_latest/IDE002.jpg",
          "assets/images/products_latest/IDE003.jpg",
          "assets/images/products_latest/IDE004.jpg",
          "assets/images/products_latest/IDE005.jpg",
          "assets/images/products_latest/IDE006.jpg",
          "assets/images/products_latest/IDE007.jpg",
        ],
      ),
      ProductModel(
        name: "Shoe 3",
        price: 50,
        image: "assets/images/products_latest/IDG000.jpg",
        images: [
          "assets/images/products_latest/IDG000.jpg",
          "assets/images/products_latest/IDG001.jpg",
          "assets/images/products_latest/IDG002.jpg",
          "assets/images/products_latest/IDG003.jpg",
          "assets/images/products_latest/IDG004.jpg",
          "assets/images/products_latest/IDG005.jpg",
          "assets/images/products_latest/IDG006.jpg",
          "assets/images/products_latest/IDG007.jpg",
        ],
      ),
      ProductModel(
        name: "Shoe 3",
        price: 50,
        image: "assets/images/products_latest/IDL000.jpg",
        images: [
          "assets/images/products_latest/IDL000.jpg",
          "assets/images/products_latest/IDL001.jpg",
          "assets/images/products_latest/IDL002.jpg",
          "assets/images/products_latest/IDL003.jpg",
          "assets/images/products_latest/IDL004.jpg",
          "assets/images/products_latest/IDL005.jpg",
          "assets/images/products_latest/IDL006.jpg",
          "assets/images/products_latest/IDL007.jpg",
        ],
      ),
      ProductModel(
        name: "Shoe 3",
        price: 50,
        image: "assets/images/products_latest/IDZ000.jpg",
        images: [
          "assets/images/products_latest/IDZ000.jpg",
          "assets/images/products_latest/IDZ001.jpg",
          "assets/images/products_latest/IDZ002.jpg",
          "assets/images/products_latest/IDZ003.jpg",
          "assets/images/products_latest/IDZ004.jpg",
          "assets/images/products_latest/IDZ005.jpg",
          "assets/images/products_latest/IDZ006.jpg",
          "assets/images/products_latest/IDZ007.jpg",
        ],
      ),
      ProductModel(
        name: "Shoe 3",
        price: 50,
        image: "assets/images/products_latest/IDC000.jpg",
        images: [
          "assets/images/products_latest/IDC000.jpg",
          "assets/images/products_latest/IDC001.jpg",
          "assets/images/products_latest/IDC002.jpg",
          "assets/images/products_latest/IDC003.jpg",
          "assets/images/products_latest/IDC004.jpg",
          "assets/images/products_latest/IDC005.jpg",
          "assets/images/products_latest/IDC006.jpg",
          "assets/images/products_latest/IDC007.jpg",
        ],
      ),
      // Add more products
    ]);
  }

  void _loadPopularProducts() {
    productsPopular.addAll([
      ProductModel(
        name: "Popular Shoe 1",
        price: 300,
        image: "assets/images/products_popular/IDA000.jpg",
        images: [
          "assets/images/products_popular/IDA000.jpg",
          "assets/images/products_popular/IDA001.jpg",
          "assets/images/products_popular/IDA002.jpg",
          "assets/images/products_popular/IDA003.jpg",
          "assets/images/products_popular/IDA004.jpg",
          "assets/images/products_popular/IDA005.jpg",
          "assets/images/products_popular/IDA006.jpg",
          "assets/images/products_popular/IDA007.jpg",
        ],
      ),
      ProductModel(
        name: "Popular Shoe 1",
        price: 300,
        image: "assets/images/products_popular/IDH000.jpg",
        images: [
          "assets/images/products_popular/IDH000.jpg",
          "assets/images/products_popular/IDH001.jpg",
          "assets/images/products_popular/IDH002.jpg",
          "assets/images/products_popular/IDH003.jpg",
          "assets/images/products_popular/IDH004.jpg",
          "assets/images/products_popular/IDH005.jpg",
          "assets/images/products_popular/IDH006.jpg",
          "assets/images/products_popular/IDH007.jpg",
          "assets/images/products_popular/IDH008.jpg",
        ],
      ),
      ProductModel(
        name: "Popular Shoe 1",
        price: 300,
        image: "assets/images/products_popular/IDI000.jpg",
        images: [
          "assets/images/products_popular/IDI000.jpg",
          "assets/images/products_popular/IDI001.jpg",
          "assets/images/products_popular/IDI002.jpg",
          "assets/images/products_popular/IDI004.jpg",
          "assets/images/products_popular/IDI005.jpg",
          "assets/images/products_popular/IDI006.jpg",
          "assets/images/products_popular/IDI007.jpg",
        ],
      ),
      ProductModel(
        name: "Popular Shoe 1",
        price: 300,
        image: "assets/images/products_popular/IDM000.jpg",
        images: [
          "assets/images/products_popular/IDM000.jpg",
          "assets/images/products_popular/IDM001.jpg",
          "assets/images/products_popular/IDM003.jpg",
          "assets/images/products_popular/IDM004.jpg",
          "assets/images/products_popular/IDM005.jpg",
          "assets/images/products_popular/IDM006.jpg",
          "assets/images/products_popular/IDM007.jpg",
          "assets/images/products_popular/IDM008.jpg",
          "assets/images/products_popular/IDM009.jpg",
        ],
      ),
      ProductModel(
        name: "Popular Shoe 1",
        price: 200,
        image: "assets/images/products_popular/IDJ000.jpg",
        images: [
          "assets/images/products_popular/IDJ000.jpg",
          "assets/images/products_popular/IDJ001.jpg",
          "assets/images/products_popular/IDJ002.jpg",
          "assets/images/products_popular/IDJ003.jpg",
          "assets/images/products_popular/IDJ004.jpg",
          "assets/images/products_popular/IDJ005.jpg",
          "assets/images/products_popular/IDJ007.jpg",
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
