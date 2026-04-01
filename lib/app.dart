import 'package:e_commerces/app/bindings/initial_binding.dart';
import 'package:e_commerces/app/routes/app_pages.dart';
import 'package:e_commerces/app/routes/app_routes.dart';
import 'package:e_commerces/app/translations/app_translations.dart';
import 'package:e_commerces/modules/home/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
   MyApp({super.key});
 final ThemeController controller = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.pages,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: controller.theme,
      translations: AppTranslations(),
      locale: Locale('english', 'US'),
      fallbackLocale: Locale('en', 'US'),
    );
  }
}
