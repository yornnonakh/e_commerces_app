import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/view/screen/bottom_nav_bar_screen.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

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
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Spacer(),
                TweenAnimationBuilder(
                  duration: Duration(milliseconds: 800),
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.check,
                          size: 60,
                          color: AppColors.backgroundLight,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),
                Text(
                  "Order Successful!",
                  style: AppTextStyle.heading.copyWith(
                    color: AppColors.backgroundLight,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Your order has been placed successfully. \n You can track it anytime.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.grey300),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.snackbar("Info", " Tracking coming soon 🚚 ");
                  },
                  child: GlassCard(
                    width: 250,
                    height: 50,
                    imagePath: '',
                    child: Center(
                      child: Text(
                        "Track Order",
                        style: AppTextStyle.categoryTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Get.to(BottomnavigationbarScreen());
                  },
                  child: GlassCard(
                    width: 250,
                    height: 50,
                    imagePath: '',
                    child: Center(
                      child: Text(
                        "Continue Shopping",
                        style: AppTextStyle.categoryTextStyle,
                      ),
                    ),
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
