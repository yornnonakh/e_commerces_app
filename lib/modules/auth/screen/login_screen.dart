import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/auth/controller/auth_controller.dart';
import 'package:e_commerces/modules/auth/screen/sign_up_screen.dart';
import 'package:e_commerces/modules/home/view/screen/bottom_nav_bar_screen.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = AuthController.instance;
  final RxBool isHidden = true.obs;

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
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🖼️ LOGO
                Image.asset(
                  AppAssets.logo, // 👉 make sure you have logo
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                GlassCard(
                  imagePath: '',
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // 📧 Emailr
                        TextField(
                          controller: emailController,
                          style: TextStyle(color: AppColors.backgroundLight),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: AppColors.grey300),
                            prefixIcon: Icon(
                              Icons.email,
                              color: AppColors.backgroundLight,
                            ),
                            filled: true,
                            fillColor: AppColors.backgroundLight.withOpacity(
                              0.1,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Obx(
                          () => TextField(
                            controller: passwordController,
                            obscureText: isHidden.value,
                            style: TextStyle(color: AppColors.backgroundLight),
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: AppColors.grey300),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: AppColors.backgroundLight,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isHidden.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  isHidden.value = !isHidden.value;
                                },
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              await auth.login(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );

                              Get.offAll(() => BottomnavigationbarScreen());
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account?",
                              style: TextStyle(color: Colors.white70),
                            ),
                            TextButton(
                              onPressed: () => Get.to(() => SignUpScreen()),
                              child: Text("Sign Up"),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),

                        // 🔹 Divider
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.white30)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Or continue with",
                                style: AppTextStyle.categoryTextStyle
                              ),
                            ),
                            Expanded(child: Divider(color: Colors.white30)),
                          ],
                        ),

                        SizedBox(height: 15),

                        // 🔹 Social Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _socialButton(
                              icon: Icons.g_mobiledata,
                              onTap: () {},
                            ),
                            SizedBox(width: 15),

                            _socialButton(icon: Icons.apple, onTap: () {}),
                            SizedBox(width: 15),

                            _socialButton(
                              icon: Icons.facebook,
                              onTap: () {
                                // TODO: Facebook Login
                              },
                            ),
                          ],
                        ),
                      ],
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

  Widget _socialButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        width: 55,
        height: 55,
        imagePath: '',
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }
}
