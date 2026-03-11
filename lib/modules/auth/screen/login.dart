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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              size: 40,
              color: const Color.fromARGB(235, 39, 206, 239),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "Welcome Back",
                style: TextStyle(
                  color: const Color.fromARGB(235, 39, 206, 239),
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppTextStyle.heading.fontFamily,
                ),
              ),
            ),
            Text("login your account", style: AppTextStyle.body),
            SizedBox(height: 160),
            Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                border: Border.all(width: 1.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined),
                    hintText: "Full Name",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                border: Border.all(width: 1.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.check_box,
                          color: const Color.fromARGB(255, 6, 234, 13),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 15, 158, 19),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 100),
                  Column(
                    children: [
                      Text(
                        'forgot password?',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 23, 152, 27),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                foregroundColor: const Color.fromARGB(232, 5, 213, 203),
                fixedSize: Size(330, 50),
              ),
              onPressed: () {},
              child: Text("Login in", style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                SizedBox(width: 5),
                Text(
                  'Sign up',
                  style: TextStyle(
                    color: const Color.fromARGB(232, 5, 213, 203),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
