import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:e_commerces/modules/home/view/widget/payments_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundcover),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.backgroundLight,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("Shopping Bag", style: AppTextStyle.buttonTextStyle),
                  ],
                ),

                const SizedBox(height: 20),

                // Items
                Expanded(
                  child: ListView(
                    children: const [
                      CartItem(name: "Facial Cleanser", price: 19.99),
                      CartItem(name: "Cream Cleanser", price: 12.99),
                      CartItem(name: "Cleansing Oil", price: 12.99),
                    ],
                  ),
                ),

                // Promo
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Promo Code",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Apply"),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Total
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Bag Total"), Text("\$50.98")],
                ),

                const SizedBox(height: 20),

                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Get.to(PaymentScreen());
                    },
                    child: const Text("Proceed To Checkout"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Cart Item Widget
class CartItem extends StatelessWidget {
  final String name;
  final double price;

  const CartItem({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GlassCard(
        imagePath: '',
        child: Row(
          children: [
            GlassCard(width: 130, height: 120, imagePath: ''),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppTextStyle.categoryTextStyle),
                    Text("\$$price", style: AppTextStyle.categoryTextStyle),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  Icon(Icons.remove_circle_outline, color: AppColors.danger),
                  SizedBox(width: 5),
                  Text("1", style: AppTextStyle.categoryTextStyle),
                  SizedBox(width: 5),
                  Icon(Icons.add_circle_outline, color: AppColors.accent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
