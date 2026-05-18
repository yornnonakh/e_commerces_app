import 'package:e_commerces/modules/home/model/products_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

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