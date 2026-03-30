import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/core/utils/responsive.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class SlideShowWidget extends StatelessWidget {
  const SlideShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // initialize responsive sizes

    return Padding(
      padding: EdgeInsets.all(SizeConfig.blockWidth * 3),
      child: ImageSlideshow(
        indicatorColor: AppColors.lightBlue,
        autoPlayInterval: 3000,
        isLoop: true,
        children: AppAssetsCover.coverSlide
            .map(
              (imagePath) => Padding(
                padding: EdgeInsets.only(left: SizeConfig.blockWidth * 2),
                child: GlassCard(
                  width: SizeConfig.screenWidth * 0.8,
                  height: SizeConfig.screenHeight * 0.25,
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
