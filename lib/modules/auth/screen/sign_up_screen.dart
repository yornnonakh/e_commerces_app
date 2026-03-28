import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/auth/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: AppColors.brightBlue,
            size: 40,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return Column(
    children: [
      _buildHeader(),
      SizedBox(height: 50),
      _buildTextFilded(),
      SizedBox(height: 20),
      _buildElevatedButton(),
      SizedBox(height: 40),
      _buildDevider(),
      SizedBox(height: 30),
      _buildLogin(),
    ],
  );
}

Widget _buildHeader() {
  return Center(
    child: Column(
      children: [
        Text(
          "Register",
          style: TextStyle(
            color: const Color.fromARGB(235, 39, 206, 239),
            fontSize: 30,
            fontWeight: FontWeight.w600,
            fontFamily: AppTextStyle.heading.fontFamily,
          ),
        ),
        Text("Create your new account"),
      ],
    ),
  );
}

Widget _buildTextFilded() {
  return Column(
    children: [
      Container(
        width: 350,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1.2),
        ),
        child: TextField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person_2_outlined),
            hintText: "Full Name",
            border: InputBorder.none,
          ),
        ),
      ),
      SizedBox(height: 20),
      Container(
        width: 350,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1.2),
        ),
        child: TextField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email),
            hintText: "user@gmail.com",
            border: InputBorder.none,
          ),
        ),
      ),
      SizedBox(height: 20),
      Container(
        width: 350,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1.2),
        ),
        child: TextField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock),
            hintText: "password",
            border: InputBorder.none,
          ),
        ),
      ),
    ],
  );
}

Widget _buildElevatedButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[100],
            foregroundColor: const Color.fromARGB(232, 5, 213, 203),
            fixedSize: const Size(330, 50),
          ),
          onPressed: () {
            Get.to(Login());
          },
          child: Text('Login in'),
        ),
        SizedBox(height: 10),
        Row(
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
      ],
    ),
  );
}

Widget _buildDevider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Row(
      children: [
        Expanded(child: Divider(color: Colors.black)),
        Text(
          "  Or Continue With ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(child: Divider(color: Colors.black)),
      ],
    ),
  );
}

Widget _buildLogin() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5),
              ],
            ),
            child: Image.asset("assets/images/google_logo.png"),
          ),
          SizedBox(width: 15),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5),
              ],
            ),
            child: Image.asset("assets/images/facebook_logo.png"),
          ),
          SizedBox(width: 15),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5),
              ],
            ),
            child: Image.asset("assets/images/apple_logo.png"),
          ),
        ],
      ),
      SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account?"),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Get.to(Login());
            },
            child: Text("Sign Up", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    ],
  );
}
