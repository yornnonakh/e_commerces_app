import 'package:flutter/material.dart';

class AppColors {
  static const brightBlue = Color(0xFF006AD7);
  static const lightBlue = Color(0xFF9AD9EA);
  static const darkBlue = Color(0xFF21277B);
  static const white = Color(0xFFFFFFFF);
  static const mediumBlue = Color(0xFF5F83B1);

  static const primary = Color(0xFF38BDF8);
  static const secondary = Color(0xFFFBBF24);
  static const accent = Color(0xFF34D399);
  static const danger = Color(0xFFF87171);
  static const backgroundLight = Color(0xFFF5F5F5);
  static const backgroundDark = Color(0xFF1F2937);
  static const textDark = Color(0xFF111827);
  static const textLight = Color(0xFFF9FAFB);
  static const grey100 = Color(0xFFF3F4F6);
  static const grey300 = Color(0xFFD1D5DB);
  static const grey500 = Color(0xFF6B7280);
  static const grey700 = Color(0xFF374151);
  static const pinkAccent = Color(0xFFF472B6);
  static const orangeAccent = Color(0xFFF97316);
  static const cyan = Color(0xFFD4EFFF);

  static const LinearGradient cyanToLightBlue = LinearGradient(
    colors: [Colors.cyan, lightBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
