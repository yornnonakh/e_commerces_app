import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/modules/home/controller/user_controller.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final UserController userController = Get.find();

  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: userController.name.value);
    emailController = TextEditingController(text: userController.email.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background Image
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
                        "Edit Profile",
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

                  // 🔹 Profile Avatar
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Obx(
                        () => CircleAvatar(
                          radius: 55,
                          backgroundColor: AppColors.lightBlue,
                          backgroundImage:
                              userController.avatarPath.value.isNotEmpty
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
                      GlassCard(
                        width: 40,
                        height: 40,
                        imagePath: '',
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt, size: 20),
                          onPressed: () {
                            // TODO: pick image from gallery or camera
                            // and update userController.avatarPath.value
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // 🔹 Editable Fields
                  Expanded(
                    child: GlassCard(
                      width: double.infinity,
                      imagePath: '',
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            _buildTextField("Name", nameController),
                            const SizedBox(height: 20),
                            _buildTextField("Email", emailController),
                            const SizedBox(height: 40),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.lightBlue,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 50,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                // Update userController data
                                userController.updateUser(
                                  newName: nameController.text,
                                  newEmail: emailController.text,
                                  // For avatar: newAvatar: userController.avatarPath.value
                                );
                                Get.back(); // return to ProfileScreen
                              },
                              child: const Text(
                                "Save Changes",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  // 🔹 Reusable Text Field
  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white30),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
