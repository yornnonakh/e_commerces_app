import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/auth/controller/auth_controller.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final auth = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.backgroundcover),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Form content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  /// Title
                  Text(
                    "Create Account",
                    style: AppTextStyle.categoryTextStyle.copyWith(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Sign up to get started",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 40),

                  /// Glass Card Form
                  GlassCard(
                    imagePath: '',
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          _buildTextField(
                            hint: "Full Name",
                            icon: Icons.person,
                            controller: nameController,
                          ),
                          const SizedBox(height: 15),

                          _buildTextField(
                            hint: "Email",
                            icon: Icons.email,
                            controller: emailController,
                          ),
                          const SizedBox(height: 15),

                          _buildTextField(
                            hint: "Password",
                            icon: Icons.lock,
                            isPassword: true,
                            controller: passwordController,
                          ),
                          const SizedBox(height: 15),

                          _buildTextField(
                            hint: "Confirm Password",
                            icon: Icons.lock_outline,
                            isPassword: true,
                            controller: confirmPasswordController,
                          ),
                          const SizedBox(height: 25),

                          /// Sign Up Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passwordController.text
                                    .trim();
                                String confirmPassword =
                                    confirmPasswordController.text.trim();

                                if (name.isEmpty ||
                                    email.isEmpty ||
                                    password.isEmpty ||
                                    confirmPassword.isEmpty) {
                                  Get.snackbar(
                                    "Error",
                                    "All fields are required",
                                  );
                                  return;
                                }

                                if (password != confirmPassword) {
                                  Get.snackbar(
                                    "Error",
                                    "Passwords do not match",
                                  );
                                  return;
                                }

                                auth.signUp(
                                  name,
                                  email,
                                  Future.value(password),
                                  confirmPassword,
                                );
                                // ❌ DO NOT navigate manually; AuthWrapper handles navigation
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.backgroundLight,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  /// Login redirect
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.white70),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back(); // Go back to Login screen
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: AppColors.backgroundLight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable TextField
  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        // ignore: deprecated_member_use
        fillColor: AppColors.backgroundLight.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
