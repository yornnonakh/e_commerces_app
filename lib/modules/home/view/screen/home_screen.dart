import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/model/products_model.dart';
import 'package:e_commerces/modules/home/view/screen/categories_screen.dart';
import 'package:e_commerces/modules/home/view/screen/product_detail.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

import '../../controller/products_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
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
            _buildSectionTitle("The Latest"),
            _buildLatestList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
                        child: _buildBadge(favCount),
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
                  width: 300,
                  height: 180,
                  imagePath: imagePath,
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
                padding: const EdgeInsets.symmetric(horizontal: 8),
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

  // ----------------- Popular List -----------------
  Widget _buildPopularList() {
    return Obx(
      () => SizedBox(
        height: 280,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.productsPopular.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) =>
              _buildPopularItem(controller.productsPopular[index]),
        ),
      ),
    );
  }

  Widget _buildPopularItem(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GlassCard(
        width: 222,
        imagePath: '',
        child: Stack(
          children: [
            Column(
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
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name, style: AppTextStyle.categoryTextStyle),
                          Text("\$${product.price}", style: AppTextStyle.categoryTextStyle),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => ProductDetail(product: product)),
                        child: GlassCard(
                          width: 50,
                          height: 50,
                          imagePath: '',
                          child: Icon(Icons.add_shopping_cart, color: AppColors.lightBlue, size: 22),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Obx(() {
                final isFav = controller.isFavorite(product);
                return GestureDetector(
                  onTap: () => controller.toggleFavorite(product),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isFav
                          ? AppColors.lightBlue.withOpacity(0.8)
                          : AppColors.backgroundLight.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: AnimatedScale(
                      scale: isFav ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(Icons.favorite,
                          color: isFav ? AppColors.backgroundLight : AppColors.lightBlue,
                          size: 20),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // ----------------- Latest List -----------------
  Widget _buildLatestList() {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.productsLatest.length,
        padding: EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) =>
            _buildLatestItem(controller.productsLatest[index]),
      ),
    );
  }

  Widget _buildLatestItem(ProductModel product) {
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
                    Text(product.name, style: const TextStyle(color: Colors.white)),
                    Text("\$${product.price}", style: TextStyle(color: AppColors.cyan)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----------------- Badge -----------------
  Widget _buildBadge(int count) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
      child: Center(
        child: Text(count.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
      ),
    );
  }
}