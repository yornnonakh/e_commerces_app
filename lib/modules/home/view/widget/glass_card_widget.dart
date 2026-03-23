import 'dart:ui';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;

  const GlassCard({
    super.key,
    this.child,
    this.width,
    this.height,
    required String? imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            // ignore: deprecated_member_use
            color: AppColors.lightBlue.withOpacity(0.10),
            // ignore: deprecated_member_use
            border: Border.all(color: AppColors.lightBlue.withOpacity(0.5)),
          ),
          child: child,
        ),
      ),
    );
  }
}
