import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/auth/controller/auth_controller.dart';
import 'package:e_commerces/modules/auth/view/screen/login_screen.dart';
import 'package:e_commerces/modules/auth/view/widgets/social-button_widgets.dart';
import 'package:e_commerces/modules/auth/view/widgets/textfield_widgets.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final auth = AuthController.instance;
  final RxBool isHidden = true.obs;
  final RxBool isConfirmHidden = true.obs;


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
                child: _buildContent(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.backgroundLight),
        ),
        SizedBox(height: 10),
        Text("Create Account", style: AppTextStyle.heading),
        Text("Sign up to get started", style: AppTextStyle.paragrapTextStyle),
        SizedBox(height: 30),
        AppTextField(
          controller: nameController,
          hint: "Full Name",
          icon: Icons.person,
        ),
        SizedBox(height: 15),
        AppTextField(
          controller: emailController,
          hint: "Email",
          icon: Icons.email,
        ),
        SizedBox(height: 15),

        /// Password
        AppTextField(
          controller: passwordController,
          hint: "Password",
          icon: Icons.lock,
          isPassword: true,
          isHidden: isHidden,
        ),
        SizedBox(height: 15),
        AppTextField(
          controller: confirmPasswordController,
          hint: "Confirm Password",
          icon: Icons.lock_outline,
          isPassword: true,
          isHidden: isConfirmHidden,
        ),
        SizedBox(height: 20),
        signupButton(),
        SizedBox(height: 10),
        loginRow(),
        SizedBox(height: 30),
        divider,
        SizedBox(height: 30),
        socialRow(),
      ],
    );
  }

  Widget signupButton() {
    return GlassCard(
      height: 60,
      width: double.infinity,
      imagePath: '',
      child: InkWell(
        onTap: () async {
          if (passwordController.text != confirmPasswordController.text) {
            Get.snackbar("Error", "Passwords do not match");
            return;
          }
          final success = await auth.register(
            nameController.text.trim(),
            emailController.text.trim(),
            passwordController.text.trim(),
          );
          if (success != null) {
            Get.offAll(() => LoginScreen());
          }
        },
        child: Center(
          child: Text("Sign Up", style: AppTextStyle.buttonTextStyle),
        ),
      ),
    );
  }

  Widget loginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?", style: AppTextStyle.categoryTextStyle),
        TextButton(
          onPressed: () => Get.to(() => LoginScreen()),
          child: Text("Login", style: TextStyle(
            color: AppColors.grey500
          ),),
        ),
      ],
    );
  }

  Row get divider {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.grey500)),
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

  Widget socialRow() {
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
