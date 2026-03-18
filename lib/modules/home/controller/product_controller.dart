import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductController extends GetxController {
  var isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}