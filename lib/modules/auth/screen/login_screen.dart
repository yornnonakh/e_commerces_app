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
                SizedBox(height: 20),
                GlassCard(
                  imagePath: '',
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 25,
                      bottom: 25,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          ],
                        ),
                        SizedBox(height: 10),
                        Text("Welcome Back", style: AppTextStyle.heading),
                        Text(
                          'Login here',
                          style: AppTextStyle.paragrapTextStyle,
                        ),
                        SizedBox(height: 30),

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
                            // ignore: deprecated_member_use
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
                                  color: AppColors.backgroundLight,
                                ),
                                onPressed: () {
                                  isHidden.value = !isHidden.value;
                                },
                              ),
                              filled: true,
                              // ignore: deprecated_member_use
                              fillColor: AppColors.backgroundLight.withOpacity(
                                0.1,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GlassCard(
                          height: 60,
                          width: double.infinity,
                          imagePath: '',
                          child: InkWell(
                            onTap: () async {
                              await auth.login(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                              Get.offAll(() => BottomnavigationbarScreen());
                            },
                            child: Center(
                              child: Text(
                                'Login',
                                style: AppTextStyle.categoryTextStyle,
                              ),
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
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(child: Divider(color: AppColors.grey500)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Or continue with",
                                style: AppTextStyle.categoryTextStyle,
                              ),
                            ),
                            Expanded(child: Divider(color: AppColors.grey500)),
                          ],
                        ),
                        SizedBox(height: 30),
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
                            _socialButton(icon: Icons.facebook, onTap: () {}),
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
        child: Icon(icon, color: AppColors.backgroundLight, size: 28),
      ),
    );
  }
}
