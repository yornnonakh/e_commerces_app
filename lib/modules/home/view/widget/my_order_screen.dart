import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

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
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
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
                        "My Orders",
                        style: AppTextStyle.categoryTextStyle
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildOrderItem(
                          orderId: "#12345",
                          status: "Delivered",
                          price: "\$120",
                        ),
                        _buildOrderItem(
                          orderId: "#12346",
                          status: "Pending",
                          price: "\$80",
                        ),
                        _buildOrderItem(
                          orderId: "#12347",
                          status: "Cancelled",
                          price: "\$45",
                        ),
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
  Widget _buildOrderItem({
    required String orderId,
    required String status,
    required String price,
  }) {
    Color statusColor;
    switch (status) {
      case "Delivered":
        statusColor = AppColors.accent;
        break;
      case "Pending":
        statusColor = AppColors.orangeAccent;
        break;
      case "Cancelled":
        statusColor = AppColors.danger;
        break;
      default:
        statusColor = AppColors.backgroundLight;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GlassCard(
        height: 100,
        imagePath: '',
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              GlassCard(
                imagePath: '',
                child: const Icon(Icons.shopping_bag, color: Colors.white),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Order $orderId",
                      style: AppTextStyle.paragrapTextStyle,
                    ),
                    const SizedBox(height: 5),
                    Text(status, style: TextStyle(color: statusColor)),
                  ],
                ),
              ),
              Text(price, style: AppTextStyle.heading.copyWith(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
