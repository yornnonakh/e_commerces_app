import 'package:e_commerces/modules/auth/controller/auth_controller.dart';
import 'package:e_commerces/modules/auth/screen/sign_up_screen.dart';
import 'package:e_commerces/modules/home/view/screen/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final auth = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login", style: TextStyle(fontSize: 28)),

            const SizedBox(height: 20),

            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
            ),

             SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Get.to(BottomnavigationbarScreen());
                auth.login(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
              },
              child: Text("Login"),
            ),

            TextButton(
              onPressed: () => Get.to(SignUpScreen()),
              child: Text("Create account"),
            ),
          ],
        ),
      ),
    );
  }
}
