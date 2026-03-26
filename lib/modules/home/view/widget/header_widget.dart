import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/modules/home/view/screen/categories_screen.dart';
import 'package:e_commerces/modules/home/view/widget/bage_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HeaderWidget extends StatelessWidget {
  final controller = Get.find(); // Adjust the controller type as needed

  HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              AppAssets.logo,
              color: AppColors.backgroundLight,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Obx(() {
                final favCount = controller.favoriteProducts.length;
                return Stack(
                  children: [
                    IconButton(
                      onPressed: () => Get.to(CategoriesScreen()),
                      icon: Image.asset(AppAsset.icons, width: 55),
                    ),
                    if (favCount > 0)
                      Positioned(
                        right: 6,
                        top: 6,
                        child: BadgeWidget(count: 5),
                      ),
                  ],
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
