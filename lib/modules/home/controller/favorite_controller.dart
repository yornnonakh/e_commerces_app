import 'package:e_commerces/modules/home/model/products_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favoriteList = <ProductModel>[].obs;

  bool isFavorite(ProductModel product) {
    return favoriteList.contains(product);
  }

  void toggleFavorite(ProductModel product) {
    if (isFavorite(product)) {
      favoriteList.remove(product);
    } else {
      favoriteList.add(product);
    }
  }
}