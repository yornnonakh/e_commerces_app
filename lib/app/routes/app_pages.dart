import 'package:e_commerces/modules/home/screen/onborading_screen.dart';
import 'package:e_commerces/modules/home/screen/slasph_screen.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.LOGIN, page: () => SlasphScreen()),
    GetPage(name: AppRoutes.HOME, page: () => OnboradingScreen()),
  ];
}
