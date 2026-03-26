import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/model/products_model.dart';
import 'package:e_commerces/modules/home/view/screen/categories_screen.dart';
import 'package:e_commerces/modules/home/view/screen/product_detail.dart';
import 'package:e_commerces/modules/home/view/widget/bage_widget.dart';
import 'package:e_commerces/modules/home/view/widget/bottom_section_widget.dart';
import 'package:e_commerces/modules/home/view/widget/category_widget.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:e_commerces/modules/home/view/widget/slide_show_widget.dart';
import 'package:flutter/material.dart';
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
            SlideShowWidget(),
            SizedBox(height: 8),
            CategoryWidget(),
            SizedBox(height: 8),
            _buildSectionTitle("The Popular"),
            _buildPopularList(),
            _buildSectionTitle("The Latest"),
            _buildLatestList(),
            BottomWidget(),
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

  Widget _buildDiscover() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("Discover", style: AppTextStyle.heading),
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
        width: 225,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: AppTextStyle.categoryTextStyle,
                          ),
                          Text(
                            "\$${product.price}",
                            style: AppTextStyle.categoryTextStyle,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () =>
                            Get.to(() => ProductDetail(product: product)),
                        child: GlassCard(
                          width: 50,
                          height: 50,
                          imagePath: '',
                          child: Icon(
                            Icons.add_shopping_cart,
                            color: AppColors.backgroundLight,
                            size: 22,
                          ),
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
                          // ignore: deprecated_member_use
                          ? AppColors.danger.withOpacity(0.8)
                          // ignore: deprecated_member_use
                          : AppColors.backgroundLight.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: AnimatedScale(
                      scale: isFav ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.favorite,
                        color: isFav
                            ? AppColors.backgroundLight
                            : AppColors.lightBlue,
                        size: 20,
                      ),
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
      child: Stack(
        children: [
          GlassCard(
            width: double.infinity,
            imagePath: '',
            child: Row(
              children: [
                SizedBox(
                  width: 200,
                  height: 188,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(product.image, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 200,
                    height: 188,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 20,
                      children: [
                        Text(
                          product.name,
                          style: AppTextStyle.featureTextStyle,
                        ),
                        Text(
                          'Good products from original branch nike, new arrivied ',
                          style: AppTextStyle.paragrapTextStyle,
                        ),
                        Row(
                          spacing: 5,
                          children: [
                            Spacer(),
                            Text(
                              "\$${product.price}",
                              style: AppTextStyle.buttonTextStyle,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(ProductDetail(product: product));
                              },
                              child: GlassCard(
                                imagePath: '',
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.shopping_cart,
                                        color: AppColors.backgroundLight,
                                      ),
                                      Text(
                                        'Add to cart',
                                        style: AppTextStyle.paragrapTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                        // ignore: deprecated_member_use
                        ? AppColors.danger.withOpacity(0.8)
                        // ignore: deprecated_member_use
                        : AppColors.backgroundLight.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: AnimatedScale(
                    scale: isFav ? 1.2 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.favorite,
                      color: isFav
                          ? AppColors.backgroundLight
                          : AppColors.lightBlue,
                      size: 20,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
