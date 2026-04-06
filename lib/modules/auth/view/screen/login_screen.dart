import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/auth/controller/auth_controller.dart';
import 'package:e_commerces/modules/auth/view/screen/sign_up_screen.dart';
import 'package:e_commerces/modules/auth/view/widgets/social-button_widgets.dart';
import 'package:e_commerces/modules/auth/view/widgets/textfield_widgets.dart';
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
            child: GlassCard(
              imagePath: '',
              child: Padding(
                padding: EdgeInsets.all(20),
                child: buildContent,
              ),
            ),
          ),
        ),
      ),
    );
  }
  Column get buildContent {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.backgroundLight),
        ),
        SizedBox(height: 10),
        Text("Welcome Back", style: AppTextStyle.heading),
        Text("Login here", style: AppTextStyle.paragrapTextStyle),
        SizedBox(height: 30),
        AppTextField(
          controller: emailController,
          hint: "Email",
          icon: Icons.email,
        ),
        SizedBox(height: 15),
        AppTextField(
          controller: passwordController,
          hint: "Password",
          icon: Icons.lock,
          isPassword: true,
          isHidden: isHidden,
        ),
        SizedBox(height: 20),
        loginButton,
        SizedBox(height: 10),
        signupRow,
        SizedBox(height: 30),
        divider,
        SizedBox(height: 30),
        socialRow,
      ],
    );
  }
  GlassCard get loginButton {
    return GlassCard(
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
          child: Text("Login", style: AppTextStyle.buttonTextStyle),
        ),
      ),
    );
  }
  Row get signupRow {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don’t have an account?", style: AppTextStyle.categoryTextStyle),
        TextButton(
          onPressed: () => Get.to(() => SignUpScreen()),
          child: Text("Sign Up", style: TextStyle(
            color: AppColors.backgroundLight
          ),),
        ),
      ],
    );
  }
  Row get divider {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.backgroundLight)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Or continue with",
            style: AppTextStyle.categoryTextStyle,
          ),
        ),
        Expanded(child: Divider(color: AppColors.backgroundLight)),
      ],
    );
  }
  Row get socialRow {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(icon: Icons.g_mobiledata, onTap: () {}),
        SizedBox(width: 15),
        SocialButton(icon: Icons.apple, onTap: () {}),
        SizedBox(width: 15),
        SocialButton(icon: Icons.facebook, onTap: () {}),
      ],
    );
  }
}
