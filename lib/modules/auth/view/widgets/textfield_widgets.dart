import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final RxBool? isHidden;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.isHidden,
  });

  @override
  Widget build(BuildContext context) {
    /// 🔹 If NOT password → NO Obx
    if (!isPassword) {
      return _buildField(obscure: false);
    }

    /// 🔹 If password → use Obx
    return Obx(() {
      return _buildField(obscure: isHidden!.value);
    });
  }

  Widget _buildField({required bool obscure}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(color: AppColors.backgroundLight),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.grey300),
        prefixIcon: Icon(icon, color: AppColors.backgroundLight),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.backgroundLight,
                ),
                onPressed: () => isHidden!.value = !isHidden!.value,
              )
            : null,
        filled: true,
        // ignore: deprecated_member_use
        fillColor: AppColors.backgroundLight.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}