import 'package:e_commerces/app/config/app_assets.dart';
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
        child: SafeArea(
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
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.white70),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.1),
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
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white70),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
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
                                backgroundColor: Colors.black,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
