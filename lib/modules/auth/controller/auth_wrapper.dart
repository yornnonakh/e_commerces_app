import 'package:e_commerces/modules/auth/controller/auth_controller.dart';
import 'package:e_commerces/modules/auth/screen/login_screen.dart';
import 'package:e_commerces/modules/home/view/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (AuthController.instance.firebaseUser.value != null) {
        return HomeScreen(); // User is logged in
      } else {
        return LoginScreen(); // User not logged in
      }
    });
  }
}