import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/screen/bottomnavigationbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 35,
              color: Color.fromARGB(235, 39, 206, 239),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),

              /// Title
              Text(
                "Welcome Back",
                style: TextStyle(
                  color: const Color.fromARGB(235, 39, 206, 239),
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppTextStyle.heading.fontFamily,
                ),
              ),

              Text("Login your account", style: AppTextStyle.body),

              const SizedBox(height: 80),

              /// Email Field
              Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 1.2),
                ),
                child: TextField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined),
                    hintText: "Full Name",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Password Field
              Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 1.2),
                ),
                child: TextField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// Remember + Forgot
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.check_box, color: Colors.green),
                        SizedBox(width: 5),
                        Text(
                          "Remember me",
                          style: TextStyle(
                            color: Color.fromARGB(255, 15, 158, 19),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 23, 152, 27),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 80),

              /// Login Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                  foregroundColor: const Color.fromARGB(232, 5, 213, 203),
                  fixedSize: const Size(330, 50),
                ),
                onPressed: () {
                  Get.to(() => BottomnavigationbarScreen());
                },
                child: const Text("Login", style: TextStyle(fontSize: 20)),
              ),

              const SizedBox(height: 15),

              /// Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Color.fromARGB(232, 5, 213, 203)),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
