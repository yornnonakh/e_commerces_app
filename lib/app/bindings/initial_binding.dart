import 'package:e_commerces/modules/home/controller/products_controller.dart';
import 'package:get/get.dart';
import '../../modules/auth/controller/auth_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<ProductController>(() => ProductController()); 
  }
}
