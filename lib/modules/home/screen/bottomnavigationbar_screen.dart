import 'package:e_commerces/modules/home/controller/bottomnavigationbar_controller.dart';
import 'package:e_commerces/modules/home/screen/home_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';


import 'categories_screen.dart';

class BottomnavigationbarScreen extends StatelessWidget {
  BottomnavigationbarScreen({super.key});

  final BottomNavigationController controller = Get.put(
    BottomNavigationController(),
  );

  final List<Widget> screens = [
    HomeScreenWidget(),
    CategoriesScreen(),
    Center(child: Text("Profile Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(() => screens[controller.currentIndex.value]),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        size: 30,
                        color: controller.currentIndex.value == 0
                            ? Colors.cyan
                            : Colors.white,
                      ),
                      onPressed: () => controller.changeIndex(0),
                    ),

                    IconButton(
                      icon: Icon(
                        Icons.shop,
                        size: 30,
                        color: controller.currentIndex.value == 1
                            ? Colors.cyan
                            : Colors.white,
                      ),
                      onPressed: () => controller.changeIndex(1),
                    ),

                    IconButton(
                      icon: Icon(
                        Icons.person,
                        size: 30,
                        color: controller.currentIndex.value == 2
                            ? Colors.cyan
                            : Colors.white,
                      ),
                      onPressed: () => controller.changeIndex(2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

