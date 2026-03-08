import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/modules/home/screen/onborading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SlasphScreen extends StatelessWidget {
  const SlasphScreen({super.key});
  void navigate() {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => OnboradingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    navigate();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.slasph),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
