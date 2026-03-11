import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
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
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 300),
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
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Discover', style: AppTextStyle.heading),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ImageSlideshow(
                  indicatorColor: AppColors.lightBlue,
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: AppAssetsCover.coverSlide.map((image) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 400,
                        height: 165,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: AppColors.primary,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: List.generate(
                  text.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(93, 0, 187, 212),
                        ),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        color: AppColors.cyan,
                        onPressed: () {
                          // logic here
                        },
                        icon: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            text[index],
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.grey700,
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'The Latest',
                    style: TextStyle(
                      color: AppColors.grey700,
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
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 280,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.backgroundLight,
                            border: Border.all(color: AppColors.cyan),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                              ),
                              color: AppColors.cyan,
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(ProductDetail());
                              },
                              child: Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          left: 15,
                          child: InkWell(
                            onTap: () {
                              // login here
                            },
                            child: Icon(
                              Icons.favorite_border,
                              color: const Color.fromARGB(123, 42, 226, 233),
                              fontWeight: FontWeight.bold,
                              size: 30,
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            width: 200,
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppAssets.products2),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
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
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'The Popular',
                    style: TextStyle(
                      color: AppColors.grey700,
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
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          width: 400,
                          height: 165,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.cyan),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 10,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppAssets.products1),
                                fit: BoxFit.contain,
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
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColors.cyan,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home, color: AppColors.backgroundLight, size: 30),
            Icon(Icons.person, color: AppColors.backgroundLight, size: 30),
            Icon(Icons.shop, color: AppColors.backgroundLight, size: 30),
          ],
        ),
      ),
    );
  }
}
