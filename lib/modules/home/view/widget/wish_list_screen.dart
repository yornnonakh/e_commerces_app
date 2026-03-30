import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.backgroundLight,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      Text("Wishlist", style: AppTextStyle.categoryTextStyle),
                      SizedBox(width: 50),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildWishItem(name: "Nike Shoes", price: "\$120"),
                        _buildWishItem(name: "Smart Watch", price: "\$80"),
                        _buildWishItem(name: "Headphones", price: "\$60"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWishItem({required String name, required String price}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: GlassCard(
        height: 100,
        imagePath: '',
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: AppColors.backgroundLight.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.image, color: AppColors.backgroundLight),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name, style: AppTextStyle.paragrapTextStyle),
                    SizedBox(height: 5),
                    Text(
                      price,
                      style: AppTextStyle.heading.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite, color: AppColors.danger),
                  Icon(Icons.shopping_cart, color: AppColors.backgroundLight),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
