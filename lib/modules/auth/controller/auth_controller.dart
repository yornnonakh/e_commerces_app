import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  void login(String email, String password) {
    isLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.offAllNamed('/home');
    });
  }
}
