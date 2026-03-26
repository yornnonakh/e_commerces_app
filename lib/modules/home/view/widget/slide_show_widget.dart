import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class SlideShowWidget extends StatelessWidget {
  const SlideShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ImageSlideshow(
        indicatorColor: AppColors.lightBlue,
        autoPlayInterval: 3000,
        isLoop: true,
        children: AppAssetsCover.coverSlide
            .map(
              (imagePath) => Padding(
                padding: const EdgeInsets.only(left: 8),
                child: GlassCard(
                  width: 300,
                  height: 180,
                  imagePath: imagePath,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
