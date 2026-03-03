import 'package:get/get.dart';
import '../../modules/auth/screen/login.dart';
import '../../modules/home/screen/home_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.LOGIN, page: () => LoginScreen()),
    GetPage(name: AppRoutes.HOME, page: () => HomeScreen()),
  ];
}
