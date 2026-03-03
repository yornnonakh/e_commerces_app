import 'package:e_commerces/app/bindings/initial_binding.dart';
import 'package:e_commerces/app/routes/app_pages.dart';
import 'package:e_commerces/app/routes/app_routes.dart';
import 'package:e_commerces/app/theme/app_theme.dart';
import 'package:e_commerces/app/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.pages,
      theme: AppTheme.lightTheme,
      translations: AppTranslations(),
      locale: Locale('english', 'US'),
      fallbackLocale: Locale('en', 'US'),
    );
  }
}
