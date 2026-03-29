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
          // 🔹 Background Image
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
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.backgroundLight,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Get.to(() => const SettingsScreen()),
                        icon: Icon(
                          Icons.settings,
                          color: AppColors.backgroundLight,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // 🔹 Profile Avatar
                Obx(
                  () => CircleAvatar(
                    radius: 55,
                    backgroundColor: AppColors.lightBlue,
                    backgroundImage: userController.avatarPath.value.isNotEmpty
                        ? AssetImage(userController.avatarPath.value)
                              as ImageProvider
                        : null,
                    child: userController.avatarPath.value.isEmpty
                        ? const Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),

                const SizedBox(height: 15),

                // 🔹 User Info
                Obx(
                  () => Text(
                    userController.name.value,
                    style: AppTextStyle.heading,
                  ),
                ),
                const SizedBox(height: 5),
                Obx(
                  () => Text(
                    userController.email.value,
                    style: TextStyle(color: AppColors.backgroundLight),
                  ),
                ),

                const SizedBox(height: 30),

                // 🔹 Menu Items
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: GlassCard(
                      width: double.infinity,
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
      padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
      child: Center(
        child: GlassCard(
          height: 62,
          imagePath: '',
          child: InkWell(
            onTap: () {
              switch (title) {
                case "Edit Profile":
                  Get.to(() => const EditProfileScreen());
                  break;
                case "My Orders":
                  Get.to(() => const MyOrderScreen());
                  break;
                case "Wishlist":
                  Get.to(() => const WishListScreen());
                  break;
                case "Settings":
                  Get.to(() => const SettingsScreen());
                  break;
                case "Logout":
                  // TODO: Implement logout functionality
                  break;
              }
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Icon(icon, color: AppColors.backgroundLight),
                ),
                const SizedBox(width: 15),
                Text(title, style: AppTextStyle.paragrapTextStyle),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
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
