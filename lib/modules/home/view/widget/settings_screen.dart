import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/controller/theme_controller.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotificationsOn = true;
  final ThemeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    // 🔹 AppBar
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
                          "Settings",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 50), // spacing for symmetry
                      ],
                    ),

                    const SizedBox(height: 30),

                    // 🔹 General Settings
                    _sectionTitle("General"),
                    Obx(
                      () => _buildSwitchTile(
                        icon: Icons.dark_mode,
                        title: "Dark Mode",
                        value: controller.isDark.value,
                        onChanged: (val) {
                          controller.toggleTheme();
                        },
                      ),
                    ),
                    _buildSwitchTile(
                      icon: Icons.notifications,
                      title: "Notifications",
                      value: isNotificationsOn,
                      onChanged: (val) {
                        setState(() {
                          isNotificationsOn = val;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    // 🔹 Account Settings
                    _sectionTitle("Account"),
                    _buildTile(
                      icon: Icons.person,
                      title: "Edit Profile",
                      onTap: () {
                        // Get.to(EditProfileScreen());
                      },
                    ),
                    _buildTile(
                      icon: Icons.lock,
                      title: "Change Password",
                      onTap: () {},
                    ),
                    _buildTile(
                      icon: Icons.security,
                      title: "Privacy & Security",
                      onTap: () {},
                    ),

                    const SizedBox(height: 20),

                    // 🔹 About
                    _sectionTitle("About"),
                    _buildTile(
                      icon: Icons.info,
                      title: "About App",
                      onTap: () {},
                    ),
                    _buildTile(
                      icon: Icons.help,
                      title: "Help & Support",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Section Title
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: AppTextStyle.heading.copyWith(
            color: AppColors.backgroundLight,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // 🔹 Normal Tile
  Widget _buildTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: GlassCard(
        height: 62,
        imagePath: '',
        child: ListTile(
          leading: Icon(icon, color: AppColors.backgroundLight),
          title: Text(title, style: AppTextStyle.paragrapTextStyle),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.white,
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  // 🔹 Switch Tile
  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: GlassCard(
        height: 62,
        imagePath: '',
        child: SwitchListTile(
          secondary: Icon(icon, color: AppColors.backgroundLight),
          title: Text(title, style: AppTextStyle.paragrapTextStyle),
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
