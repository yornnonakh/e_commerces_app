import 'package:e_commerces/app/config/app_assets.dart';
import 'package:flutter/material.dart';

class AddCardWidget extends StatelessWidget {
  const AddCardWidget({super.key});

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
                    Icon(Icons.arrow_back_ios),
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
                _input("Name"),
                SizedBox(height: 10),
                _input("Card Number"),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: _input("CVV")),
                    SizedBox(width: 10),
                    Expanded(child: _input("Expires")),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: null),
                    Text("Save card info"),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: Text("Save")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _input(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
