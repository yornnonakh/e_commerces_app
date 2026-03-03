import 'package:get/get.dart';
import '../../modules/auth/controller/auth_controller.dart';
import '../../modules/home/controller/home_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
  }
}
