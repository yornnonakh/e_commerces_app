// ignore: file_names
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        width: 55,
        height: 55,
        imagePath: '',
        child: Icon(icon, color: AppColors.backgroundLight, size: 28),
      ),
    );
  }
}