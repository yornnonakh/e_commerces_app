import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/controller/search_controller.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.backgroundcover),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 🔍 Search Button
          Positioned(
            top: 75,
            left: 10,
            right: 10,
            child: GestureDetector(
              onTap: showSearchDialog,
              child: GlassCard(
                width: 400,
                height: 50,
                imagePath: '',
                child: Row(
                  spacing: 8,
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.search, color: AppColors.backgroundLight),
                    SizedBox(width: 10),
                    Text("Search...", style: AppTextStyle.buttonTextStyle,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
