import 'dart:ui';
import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/modules/home/controller/hover_controller.dart';
import 'package:e_commerces/modules/home/controller/product_controller.dart';
import 'package:e_commerces/modules/home/screen/categories_screen.dart';
import 'package:e_commerces/modules/home/screen/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> text = ['All', 'For men', 'For women', 'Runing'];

  final controller = Get.find<HomeController>();
  final controllerIcon = Get.put(ProductController());
  final controllerimage = Get.put(HoverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundcover),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70, left: 300),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // login
                      },
                      icon: Icon(
                        Icons.search,
                        color: AppColors.lightBlue,
                        fontWeight: FontWeight.bold,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(CategoriesScreen());
                      },
                      icon: Image.asset(
                        AppIcons.icons,
                        width: 55,
                        height: 55,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Discover',
                      style: TextStyle(
                        color: AppColors.backgroundLight,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: ImageSlideshow(
                    indicatorColor: AppColors.lightBlue,
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: AppAssetsCover.coverSlide.map((image) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: 400,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // ignore: deprecated_member_use
                                color: Colors.white.withOpacity(
                                  0.15,
                                ), // glass color
                                border: Border.all(
                                  // ignore: deprecated_member_use
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1.5,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: List.generate(
                      text.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                // ignore: deprecated_member_use
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  // ignore: deprecated_member_use
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    // ignore: deprecated_member_use
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  // logic here
                                },
                                icon: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  child: Text(
                                    text[index],
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'The Popular',
                      style: TextStyle(
                        color: AppColors.backgroundLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          // Card background
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                              child: Container(
                                width: 200,
                                height: 280,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors.backgroundLight.withOpacity(
                                    0.15,
                                  ),
                                  border: Border.all(
                                    color: AppColors.backgroundLight
                                        .withOpacity(0.3),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.backgroundDark
                                          .withOpacity(0.1),
                                      blurRadius: 15,
                                      offset: Offset(0, 8),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          /// Product Image
                          Positioned(
                            top: 0,
                            child: Container(
                              width: 200,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    AppAssetsProductLates.productLates[index],
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),

                          /// Product Name & Price
                          Positioned(
                            top: 185, // below image
                            left: 15,
                            right: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product ${index + 1}", // Replace with your product name list if available
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "\$${(index + 1) * 10}", // Replace with your product price list
                                  style: TextStyle(
                                    color: AppColors.cyan,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// Favorite Button
                          Positioned(
                            top: 15,
                            left: 15,
                            child: Obx(
                              () => InkWell(
                                onTap: controllerIcon.isFavorite.call,
                                child: Icon(
                                  controllerIcon.isFavorite.value
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: controllerIcon.isFavorite.value
                                      ? Colors.white
                                      : AppColors.cyan.withOpacity(0.3),
                                  size: 30,
                                ),
                              ),
                            ),
                          ),

                          /// Add to Cart Button
                          Positioned(
                            bottom: 15,
                            right: 15,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.cyan.withOpacity(0.2),
                                border: Border.all(
                                  color: AppColors.cyan.withOpacity(0.8),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.cyan.withOpacity(0.15),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(ProductDetail());
                                },
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.backgroundLight,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'The Latest',
                      style: TextStyle(
                        color: AppColors.backgroundLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 400,
                                height: 200,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white.withOpacity(0.15),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.backgroundDark
                                          .withOpacity(0.1),
                                      blurRadius: 15,
                                      offset: Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(ProductDetail());
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            color: AppColors.cyan.withOpacity(
                                              0.2,
                                            ),
                                            border: Border.all(
                                              color: AppColors.cyan.withOpacity(
                                                0.8,
                                              ),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.cyan
                                                    .withOpacity(0.15),
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: AppColors.backgroundLight,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 0,
                            right: 75,
                            child: SizedBox(
                              width: 250,
                              height: 180,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      AppAssetsProductPopular
                                          .productPopular[index],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 25,
                            left: 15,
                            child: Obx(() {
                              bool isFav = controllerimage.favoriteList
                                  .contains(index);
                              return InkWell(
                                onTap: () =>
                                    controllerimage.toggleFavorite(index),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isFav
                                        // ignore: deprecated_member_use
                                        ? AppColors.danger.withOpacity(0.8)
                                        // ignore: deprecated_member_use
                                        : AppColors.backgroundLight.withOpacity(
                                            0.3,
                                          ),
                                    border: Border.all(
                                      // ignore: deprecated_member_use
                                      color: AppColors.backgroundLight
                                          .withOpacity(0.10),
                                    ),
                                  ),
                                  child: Icon(
                                    isFav
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isFav
                                        ? Colors.white
                                        : Colors.white70,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
