import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerces/app/core/utils/responsive.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';

class CategoryController extends GetxController {
  var selectedIndex = 0.obs;
  void selectCategory(int index) => selectedIndex.value = index;
}

class CategoryWidget extends StatelessWidget {
  final List<String> categories = ['All', 'For men', 'For women', 'Running'];
  final CategoryController controller = Get.put(CategoryController());

  CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SizedBox(
      height: SizeConfig.blockHeight * 5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 6),
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = controller.selectedIndex.value == index;
            return GestureDetector(
              onTap: () => controller.selectCategory(index),
              child: Container(
                margin: EdgeInsets.only(right: SizeConfig.blockWidth * 2),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth * 3,
                 
                ),
                decoration: BoxDecoration(
                  
                  gradient: isSelected
                      ? LinearGradient(
                          colors: [AppColors.brightBlue, AppColors.lightBlue],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: isSelected
                      ? null
                      : AppColors.backgroundLight.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(
                    SizeConfig.blockWidth * 4,
                  ),
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : AppColors.lightBlue.withOpacity(0.3),
                  ),
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: AppTextStyle.categoryTextStyle.copyWith(
                      color: isSelected ? Colors.white : AppColors.lightBlue,
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
