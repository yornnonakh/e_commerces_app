import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/screen/widget/glass_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';
import 'categories_screen.dart';

class HomeScreenWidget extends StatelessWidget {
  HomeScreenWidget({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(AppAssets.backgroundcover),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildDiscover(),
            SizedBox(height: 8),
            _buildSlideshow(),
            SizedBox(height: 8),
            _buildCategory(),
            SizedBox(height: 8),
            _buildSectionTitle("The Popular"),
            _buildPopularList(),
            _buildSectionTitle("The Lates"),
            _buildLatestList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 300),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors.lightBlue, size: 35),
          ),
          IconButton(
            onPressed: () => Get.to(CategoriesScreen()),
            icon: Image.asset(AppAsset.icons, width: 55),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscover() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("Discover", style: AppTextStyle.heading),
      ),
    );
  }

  Widget _buildSlideshow() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ImageSlideshow(
        indicatorColor: AppColors.lightBlue,
        autoPlayInterval: 3000,
        isLoop: true,
        children: AppAssetsCover.coverSlide
            .map(
              (imagePath) => Padding(
                padding: const EdgeInsets.only(left: 8),
                child: GlassCard(
                  width: 300, // adjust as needed
                  height: 180, // adjust as needed
                  imagePath:
                      imagePath, // optional if you want a background image
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildCategory() {
    final categories = ['All', 'For men', 'For women', 'Running'];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: GlassCard(
            imagePath: '',
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  categories[index],
                  style: AppTextStyle.categoryTextStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: AppTextStyle.featureTextStyle),
      ),
    );
  }

  Widget _buildPopularList() {
    return Obx(
      () => SizedBox(
        height: 280,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.products.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) => _buildPopularItem(index),
        ),
      ),
    );
  }

  Widget _buildPopularItem(int index) {
    final product = controller.products[index];

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GlassCard(
        width: 200,
        imagePath: '',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "\$${product.price}",
                style: TextStyle(color: AppColors.cyan),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLatestList() {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.products.length,
        padding: EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) => _buildLatestItem(index),
      ),
    );
  }

  Widget _buildLatestItem(int index) {
    final product = controller.products[index];

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GlassCard(
        width: double.infinity,
        imagePath: '',
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(product.image, fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "\$${product.price}",
                      style: TextStyle(color: AppColors.cyan),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
