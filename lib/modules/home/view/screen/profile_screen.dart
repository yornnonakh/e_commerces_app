import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.backgroundcover),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Profile", style: AppTextStyle.categoryTextStyle),
                      IconButton(
                        onPressed: () {
                          // Get.to(HomeScreen());
                        },
                        icon: Icon(
                          Icons.settings,
                          color: AppColors.backgroundLight,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                CircleAvatar(
                  radius: 55,
                  backgroundColor: AppColors.lightBlue,
                  child: CircleAvatar(
                    radius: 50,
                    // backgroundImage: AssetImage(AppAssets.), // add your image
                  ),
                ),
                SizedBox(height: 15),
                Text("User Profile", style: AppTextStyle.heading),
                SizedBox(height: 5),
                Text(
                  "user@example.com",
                  style: TextStyle(color: AppColors.backgroundLight),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: GlassCard(
                      width: 450,
                      imagePath: '',
                      child: Column(
                        children: [
                          _buildItem(Icons.person, "Edit Profile"),
                          _buildItem(Icons.shopping_bag, "My Orders"),
                          _buildItem(Icons.favorite, "Wishlist"),
                          _buildItem(Icons.settings, "Settings"),
                          _buildItem(Icons.logout, "Logout"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String title) {
    return Padding(
      padding: EdgeInsets.only(right: 15, left: 15, top: 15),
      child: Center(
        child: GlassCard(
          height: 62,
          imagePath: '',
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Icon(icon, color: AppColors.backgroundLight),
              ),
              SizedBox(width: 15),
              Text(title, style: AppTextStyle.paragrapTextStyle),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.backgroundLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
