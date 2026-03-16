import 'dart:ui';

import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                              child: Container(
                                width: 200,
                                height: 280,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  // ignore: deprecated_member_use
                                  color: AppColors.backgroundLight.withOpacity(
                                    0.15,
                                  ),
                                  border: Border.all(
                                    // ignore: deprecated_member_use
                                    color: AppColors.backgroundLight
                                        // ignore: deprecated_member_use
                                        .withOpacity(0.3),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      // ignore: deprecated_member_use
                                      color: AppColors.backgroundDark
                                          // ignore: deprecated_member_use
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
                            child: Container(
                              width: 200,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(AppAssets.productsLates),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),

                          /// Favorite Button
                          Positioned(
                            top: 15,
                            left: 15,
                            child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),

                          /// Add to Cart Button
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                ),
                                // ignore: deprecated_member_use
                                color: AppColors.backgroundDark.withOpacity(
                                  0.25,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(ProductDetail());
                                },
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                  size: 28,
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  // ignore: deprecated_member_use
                                  color: Colors.white.withOpacity(0.15),
                                  border: Border.all(
                                    // ignore: deprecated_member_use
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      // ignore: deprecated_member_use
                                      color: AppColors.backgroundDark
                                          // ignore: deprecated_member_use
                                          .withOpacity(0.1),
                                      blurRadius: 15,
                                      offset: Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                      ),
                                      child: Text(
                                        'Amazing NIke',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: AppColors.backgroundLight,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        left: 10,
                                      ),
                                      child: Text(
                                        '\$500',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.backgroundLight,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 80),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('rating'),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Icon(Icons.add_circle),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          /// products popular
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 100,
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppAssets.productPopular),
                                  fit: BoxFit.cover,
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
            ],
          ),
        ),
      ),
    );
  }
}
