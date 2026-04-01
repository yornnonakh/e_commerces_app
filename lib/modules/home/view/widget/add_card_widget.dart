import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/view/screen/success_screen.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AddCardWidget extends StatelessWidget {
  AddCardWidget({super.key});

  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final cvvController = TextEditingController();
  final expireController = TextEditingController();

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
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Add New Card",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                _input("Name", nameController),
                SizedBox(height: 10),
                _input("Card Number", numberController),
                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(child: _input("CVV", cvvController)),
                    SizedBox(width: 10),
                    Expanded(child: _input("Expires", expireController)),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    Checkbox(value: true, onChanged: (v) {}),
                    Text("Save card info"),
                  ],
                ),

                Spacer(),

                /// 🔥 SAVE BUTTON
                GestureDetector(
                  onTap: () {
                    _onSave();
                    Get.to(SuccessScreen());
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: GlassCard(
                      width: 300,
                      height: 60,
                      imagePath: '',
                      child: Center(
                        child: Text(
                          'Save',
                          style: AppTextStyle.categoryTextStyle,
                        ),
                      ),
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

  Widget _input(String hint, TextEditingController controller) {
    return GlassCard(
      imagePath: '',
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  /// 🔥 SAVE FUNCTION
  void _onSave() {
    if (nameController.text.isEmpty ||
        numberController.text.isEmpty ||
        cvvController.text.isEmpty ||
        expireController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    /// Create card object
    final newCard = {
      "name": nameController.text,
      "number": numberController.text,
      "cvv": cvvController.text,
      "expire": expireController.text,
    };

    /// Go back + send data
    Get.back(result: newCard);
  }
}
