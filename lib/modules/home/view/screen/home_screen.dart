import 'package:e_commerces/modules/home/view/screen/shopping_screen.dart';
import 'package:e_commerces/modules/home/view/widget/category_widget.dart';
import 'package:e_commerces/modules/home/view/widget/slide_show_widget.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:e_commerces/modules/home/view/screen/product_detail.dart';
import 'package:e_commerces/modules/home/view/widget/bottom_widget.dart';
import 'package:e_commerces/modules/home/view/widget/bage_widget.dart';
import 'package:e_commerces/modules/home/model/products_model.dart';
import 'package:e_commerces/app/core/utils/responsive.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import '../../controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
            
          ),
          Row(
            children: [
              Obx(() {
                final favCount = controller.favoriteProducts.length;
                return Stack(
                  children: [
                    IconButton(
                      onPressed: () => Get.to(ShoppingScreen()),
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
      padding: EdgeInsets.all(SizeConfig.blockWidth * 3), // responsive padding
      child: GlassCard(
        width: SizeConfig.screenWidth * 0.55, // responsive width
        imagePath: '',
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.blockWidth * 4,
                    ),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockWidth * 3,
                    vertical: SizeConfig.blockHeight * 1.5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product name and price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: AppTextStyle.categoryTextStyle.copyWith(
                              fontSize: SizeConfig.blockWidth * 4,
                            ),
                          ),
                          Text(
                            "\$${product.price}",
                            style: AppTextStyle.categoryTextStyle.copyWith(
                              fontSize: SizeConfig.blockWidth * 3.5,
                            ),
                          ),
                        ],
                      ),
                      // Add to cart button
                      GestureDetector(
                        onTap: () =>
                            Get.to(() => ProductDetail(product: product)),
                        child: GlassCard(
                          width: SizeConfig.blockWidth * 12,
                          height: SizeConfig.blockWidth * 12,
                          imagePath: '',
                          child: Icon(
                            Icons.add_shopping_cart,
                            color: AppColors.backgroundLight,
                            size: SizeConfig.blockWidth * 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Favorite button
            Positioned(
              top: SizeConfig.blockHeight * 1.5,
              left: SizeConfig.blockWidth * 3,
              child: Obx(() {
                final isFav = controller.isFavorite(product);
                return GestureDetector(
                  onTap: () => controller.toggleFavorite(product),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.all(SizeConfig.blockWidth * 2),
                    decoration: BoxDecoration(
                      color: isFav
                          ? AppColors.danger.withOpacity(0.8)
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
                        size: SizeConfig.blockWidth * 5,
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
      padding: EdgeInsets.all(SizeConfig.blockWidth * 3), // responsive padding
      child: Stack(
        children: [
          GlassCard(
            width: SizeConfig.screenWidth,
            imagePath: '',
            child: Row(
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth * 0.4,
                  height: SizeConfig.screenHeight * 0.20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.blockWidth * 5,
                    ),
                    child: Image.asset(product.image, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(SizeConfig.blockWidth * 2),
                  child: SizedBox(
                    width: SizeConfig.screenWidth * 0.49,
                    height: SizeConfig.screenHeight * 0.19,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: AppTextStyle.featureTextStyle.copyWith(
                            fontSize: SizeConfig.blockWidth * 5,
                          ),
                        ),
                        Text(
                          'Good products from original branch nike, new arrived',
                          style: AppTextStyle.paragrapTextStyle.copyWith(
                            fontSize: SizeConfig.blockWidth * 3.3,
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Text(
                              "\$${product.price}",
                              style: AppTextStyle.buttonTextStyle.copyWith(
                                fontSize: SizeConfig.blockWidth * 5,
                              ),
                            ),
                            SizedBox(width: SizeConfig.blockWidth * 2),
                            GestureDetector(
                              onTap: () {
                                Get.to(ProductDetail(product: product));
                              },
                              child: GlassCard(
                                imagePath: '',
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.blockHeight * 1.5,
                                    horizontal: SizeConfig.blockWidth * 3,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.shopping_cart,
                                        color: AppColors.backgroundLight,
                                        size: SizeConfig.blockWidth * 5,
                                      ),
                                      SizedBox(
                                        width: SizeConfig.blockWidth * 1.5,
                                      ),
                                      Text(
                                        'Add to cart',
                                        style: AppTextStyle.paragrapTextStyle
                                            .copyWith(
                                              fontSize:
                                                  SizeConfig.blockWidth * 3.2,
                                            ),
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
            top: SizeConfig.blockHeight * 1.5,
            left: SizeConfig.blockWidth * 3,
            child: Obx(() {
              final isFav = controller.isFavorite(product);
              return GestureDetector(
                onTap: () => controller.toggleFavorite(product),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.all(SizeConfig.blockWidth * 2),
                  decoration: BoxDecoration(
                    color: isFav
                        ? AppColors.danger.withOpacity(0.8)
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
                      size: SizeConfig.blockWidth * 5,
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
