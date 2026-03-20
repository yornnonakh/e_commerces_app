import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/modules/home/model/home_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var latestProducts = <ProductModel>[].obs; // ✅ reactive and initialized
  var popularProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() {
    latestProducts.value = [
      ProductModel(
        name: "Running Shoes",
        price: 50,
        image: AppAssetsProductPopular.productPopular[0],
      ),
      ProductModel(
        name: "T-Shirt",
        price: 20,
        image: AppAssetsProductPopular.productPopular[1],
      ),
      ProductModel(
        name: "Sneakers",
        price: 60,
        image: AppAssetsProductPopular.productPopular[2],
      ),
    ];

    popularProducts.value = [
      ProductModel(
        name: "Jacket",
        price: 80,
        image: AppAssetsProductPopular.productPopular[3],
      ),
      ProductModel(
        name: "Hat",
        price: 15,
        image: AppAssetsProductPopular.productPopular[4],
      ),
    ];
  }
}