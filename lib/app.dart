import 'package:e_commerces/modules/home/binding/home_binding.dart';
import 'package:e_commerces/modules/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      title: '',
      initialBinding: HomeBinding(),
    );
  }
}
