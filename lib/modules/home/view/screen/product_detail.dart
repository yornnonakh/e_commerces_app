import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/modules/home/controller/products_detail_controller.dart';
import 'package:e_commerces/modules/home/model/products_model.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
  final ProductDetailController controller = Get.put(ProductDetailController());

  ProductDetail({super.key, required this.product});

  List<String> get images =>
      product.images.isNotEmpty ? product.images : AppAssets.latestProductsDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.backgroundcover),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Top cyan
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              color: AppColors.cyan.withOpacity(0.3),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200),
              ),
            ),
          ),
          // Back button
          Positioned(
            top: 50,
            left: 20,
            child: GlassCard(
              width: 40,
              height: 40,
              imagePath: '',
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back_ios, color: AppColors.backgroundDark),
              ),
            ),
          ),
          // Product images
          Positioned(
            top: 200,
            left: 20,
            right: 20,
            bottom: 20,
            child: Column(
              children: [
                Expanded(
                  child: Obx(() {
                    int index = controller.currentIndex.value;
                    if (index >= images.length) index = 0;
                    return Image.asset(images[index], fit: BoxFit.contain);
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => controller.previousImage(images.length),
                        icon: const Icon(Icons.arrow_left)),
                    IconButton(
                        onPressed: () => controller.nextImage(images.length),
                        icon: const Icon(Icons.arrow_right)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}