import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyle {
  static const heading = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: AppColors.backgroundLight,
  );

  static const body = TextStyle(
    fontSize: 20,
    fontFamily: 'Roboto',
    color: AppColors.backgroundLight,
  );

  static const categoryTextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.backgroundLight,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
  );

  static const featureTextStyle = TextStyle(
    fontSize: 22,
    color: AppColors.backgroundLight,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
  );
}
