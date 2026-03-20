import 'package:e_commerces/modules/home/controller/hover_controller.dart';
import 'package:e_commerces/modules/home/controller/product_controller.dart';
import 'package:get/get.dart';
import '../../modules/auth/controller/auth_controller.dart';
import '../../modules/home/controller/home_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProductController>(() => ProductController()); 
    Get.lazyPut<HoverController>(() => HoverController());     
  }
}
