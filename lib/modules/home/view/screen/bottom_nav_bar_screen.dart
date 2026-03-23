import 'dart:ui';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/modules/home/controller/bottomnavigationbar_controller.dart';
import 'package:e_commerces/modules/home/view/screen/home_screen.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'categories_screen.dart';

class BottomnavigationbarScreen extends StatelessWidget {
  BottomnavigationbarScreen({super.key});

  final BottomNavigationController controller = Get.put(
    BottomNavigationController(),
  );

  final List<Widget> screens = [
    HomeScreen(),
    CategoriesScreen(),
    const Center(child: Text("Profile Screen")),
  ];
  final List<IconData> icons = [Icons.home, Icons.shop, Icons.person];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(() => screens[controller.currentIndex.value]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: _buildGlassNavBar(),
      ),
    );
  }

  Widget _buildGlassNavBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: GlassCard(
          height: 75,
          imagePath: '',
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                icons.length,
                (index) => _buildNavItem(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final isActive = controller.currentIndex.value == index;
    return IconButton(
      onPressed: () => controller.changeIndex(index),
      icon: Icon(
        icons[index],
        size: 30,
        color: isActive ? AppColors.backgroundLight : AppColors.grey500,
      ),
    );
  }
}
