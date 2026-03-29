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
          // 🔹 Background
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
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // 🔹 Top Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.backgroundLight,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      const Text(
                        "Wishlist",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Wishlist Items
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

  // 🔹 Wishlist Item Card
  Widget _buildWishItem({required String name, required String price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GlassCard(
        height: 100,
        imagePath: '',
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // 🔹 Product Image Placeholder
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.image, color: Colors.white),
              ),

              const SizedBox(width: 15),

              // 🔹 Product Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name, style: AppTextStyle.paragrapTextStyle),
                    const SizedBox(height: 5),
                    Text(
                      price,
                      style: AppTextStyle.heading.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),

              // 🔹 Actions
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite, color: Colors.red),
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
