import 'package:e_commerces/modules/home/views/home_screen.dart';
import 'package:get/instance_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreen());
  }
}
