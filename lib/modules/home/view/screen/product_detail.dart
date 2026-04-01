import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/core/utils/responsive.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/controller/products_controller.dart';
import 'package:e_commerces/modules/home/controller/products_detail_controller.dart';
import 'package:e_commerces/modules/home/controller/size_controller.dart'; // ✅ ADD THIS
import 'package:e_commerces/modules/home/model/products_model.dart';
import 'package:e_commerces/modules/home/view/screen/shopping_screen.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;

  final ProductDetailController controller =
      Get.put(ProductDetailController());

  final SizeController sizeController = Get.put(SizeController());

  final ProductController productController =
      Get.find<ProductController>(); // ✅ GET CONTROLLER

  ProductDetail({super.key, required this.product});

  List<String>? get images => product.images.isNotEmpty
      ? product.images
      : AppAssets.latestProductsDetail;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.backgroundcover),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Top design
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.45,
            decoration: BoxDecoration(
              border: Border.all(
                // ignore: deprecated_member_use
                color: AppColors.lightBlue.withOpacity(0.3),
              ),
              // ignore: deprecated_member_use
              color: AppColors.lightBlue.withOpacity(0.08),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(SizeConfig.blockWidth * 60),
              ),
            ),
          ),

          // Image slider
          Positioned(
            top: SizeConfig.blockHeight * 12,
            left: SizeConfig.blockWidth * 5,
            right: SizeConfig.blockWidth * 5,
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.28,
                  child: Obx(() {
                    int index = controller.currentIndex.value;
                    if (index >= images!.length) index = 0;

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Image.asset(
                        images![index],
                        key: ValueKey(index),
                        fit: BoxFit.contain,
                      ),
                    );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _iconButton(Icons.arrow_back_ios, () {
                      controller.previousImage(images!.length);
                    }),
                    _iconButton(Icons.arrow_forward_ios, () {
                      controller.nextImage(images!.length);
                    }),
                  ],
                ),
              ],
            ),
          ),

          // Back button
          Positioned(
            top: SizeConfig.blockHeight * 7,
            left: SizeConfig.blockWidth * 5,
            child: _iconButton(Icons.arrow_back, () => Get.back()),
          ),

          // Favorite button (optional)
          Positioned(
            top: SizeConfig.blockHeight * 7,
            right: SizeConfig.blockWidth * 5,
            child: _iconButton(Icons.favorite_border, () {}),
          ),

          // Bottom card
          Positioned(
            bottom: 0,
            child: GlassCard(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.55,
              imagePath: '',
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, style: AppTextStyle.heading),

                    SizedBox(height: SizeConfig.blockHeight * 1),

                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(Icons.star,
                              color: AppColors.danger, size: 18),
                        SizedBox(width: 6),
                        Text("5.0",
                            style: AppTextStyle.categoryTextStyle),
                      ],
                    ),

                    SizedBox(height: SizeConfig.blockHeight * 2),

                    Text("Select Size",
                        style: AppTextStyle.buttonTextStyle),

                    SizedBox(height: SizeConfig.blockHeight * 1),

                    SizedBox(
                      height: SizeConfig.blockWidth * 12,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Obx(() {
                            final isSelected =
                                sizeController.selectedIndex.value ==
                                    index;

                            return GestureDetector(
                              onTap: () =>
                                  sizeController.selectItem(index),
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: SizeConfig.blockWidth * 2),
                                width: SizeConfig.blockWidth * 12,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.danger
                                      // ignore: deprecated_member_use
                                      : AppColors.backgroundLight.withOpacity(
                                          0.3,
                                        ),
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    // ignore: deprecated_member_use
                                    color: AppColors.lightBlue.withOpacity(0.3),
                                  ),
                                ),
                                child: Center(
                                  child: Text("${40 + index}"),
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    ),

                    SizedBox(height: SizeConfig.blockHeight * 2),

                    Text("Description",
                        style: AppTextStyle.heading),

                    SizedBox(height: SizeConfig.blockHeight * 1),

                    Text(
                      "Flywire cables help secure your feet and provide support.\nNike Air cushioning absorbs impact.",
                      style: AppTextStyle.paragrapTextStyle,
                    ),

                    Spacer(),

                    // ✅ PRICE + ADD TO CART
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price}',
                          style: AppTextStyle.featureTextStyle,
                        ),

                        InkWell(
                          onTap: () {
                            // ✅ ADD TO CART
                            productController.addToCart(product);

                            // ✅ MESSAGE
                            Get.snackbar(
                              "Success",
                              "${product.name} added to cart",
                              snackPosition:
                                  SnackPosition.BOTTOM,
                            );

                            // ✅ GO TO CART
                            Get.to(() => ShoppingScreen());
                          },
                          child: GlassCard(
                            height:
                                SizeConfig.blockHeight * 5,
                            imagePath: '',
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: AppColors
                                        .backgroundLight,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.all(10),
                                  child: Text(
                                    'Add to Cart',
                                    style: AppTextStyle
                                        .categoryTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Button
  Widget _iconButton(IconData icon, VoidCallback onTap) {
    return GlassCard(
      width: SizeConfig.blockWidth * 10,
      height: SizeConfig.blockWidth * 10,
      imagePath: '',
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: AppColors.backgroundLight),
      ),
    );
  }
}