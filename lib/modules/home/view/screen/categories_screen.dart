import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child:
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Column(
              children: [
                GlassCard(
                  width: 50,
                  height: 50,
                   imagePath: '',
                  child: IconButton(onPressed: 
                  (){
                    Get.back();
                  }, icon:Icon(Icons.arrow_back_ios, color: AppColors.backgroundLight,)),
                )
              ],
            ),
          ),),
        ),
      
    );
  }
}
