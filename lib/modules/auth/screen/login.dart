import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../app/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.find<AuthController>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Padding(
        padding:  EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login", style: AppTextStyle.heading),
             SizedBox(height: 20),
            TextField(controller: emailController),
             SizedBox(height: 10),
            TextField(controller: passController),
             SizedBox(height: 20),
            Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () {
                  controller.login(emailController.text, passController.text);
                },
                child: controller.isLoading.value
                    ?  CircularProgressIndicator(color: Colors.white)
                    :  Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
