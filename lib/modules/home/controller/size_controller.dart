import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SizeController extends GetxController {
  var selectedIndex = (-1).obs;

  void selectItem(int index) {
    selectedIndex.value = index;
  }
}
