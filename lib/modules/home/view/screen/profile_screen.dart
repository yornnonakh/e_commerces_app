import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/controller/user_controller.dart';
import 'package:e_commerces/modules/home/view/widget/edit_profile_screen.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:e_commerces/modules/home/view/widget/my_order_screen.dart';
import 'package:e_commerces/modules/home/view/widget/settings_screen.dart';
import 'package:e_commerces/modules/home/view/widget/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final UserController userController = Get.put(UserController());

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
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      IconButton(
                        onPressed: () => Get.to(() => SettingsScreen()),
                        icon: Icon(
                          Icons.settings,
                          color: AppColors.backgroundLight,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Obx(
                  () => CircleAvatar(
                    radius: 55,
                    backgroundColor: AppColors.lightBlue,
                    backgroundImage: userController.avatarPath.value.isNotEmpty
                        ? AssetImage(userController.avatarPath.value)
                              as ImageProvider
                        : null,
                    child: userController.avatarPath.value.isEmpty
                        ? Icon(Icons.person, size: 50, color: Colors.white)
                        : null,
                  ),
                ),
                SizedBox(height: 15),
                Obx(
                  () => Text(
                    userController.name.value,
                    style: AppTextStyle.heading,
                  ),
                ),
                SizedBox(height: 5),
                Obx(
                  () => Text(
                    userController.email.value,
                    style: TextStyle(color: AppColors.backgroundLight),
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: GlassCard(
                        width: double.infinity,
                        height: 408,
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
          child: InkWell(
            onTap: () {
              switch (title) {
                case "Edit Profile":
                  Get.to(() => EditProfileScreen());
                  break;
                case "My Orders":
                  Get.to(() => MyOrderScreen());
                  break;
                case "Wishlist":
                  Get.to(() => WishListScreen());
                  break;
                case "Settings":
                  Get.to(() => SettingsScreen());
                  break;
                case "Logout":
                  break;
              }
            },
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
      ),
    );
  }
}
