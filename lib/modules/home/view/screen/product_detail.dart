import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/controller/products_detail_controller.dart';
import 'package:e_commerces/modules/home/model/products_model.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
  final ProductDetailController controller = Get.put(ProductDetailController());

  ProductDetail({super.key, required this.product});

  List<String>? get images => product.images.isNotEmpty
      ? product.images
      : AppAssets.latestProductsDetail;

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
          Positioned(
            bottom: 40,
            child: Container(
              width: 450,
              height: 920,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                border: Border.all(color: AppColors.lightBlue.withOpacity(0.5)),
                // ignore: deprecated_member_use
                color: AppColors.lightBlue.withOpacity(0.10),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(250),
                  bottomRight: Radius.circular(250),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 400,
                    height: 450,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(product.name, style: AppTextStyle.heading),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '\$${product.price}',
                              style: AppTextStyle.featureTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: GlassCard(
                                  width: 50,
                                  height: 50,
                                  imagePath: '',
                                  child: Center(child: Text('${index + 40}')),
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          children: [
                            for (int i = 0; i < 5; i++)
                              const Icon(
                                Icons.star,
                                color: AppColors.danger,
                                size: 24,
                              ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Flywire cables help secure your feet and provide support when you tighten the laces, so you can stay stable.\n Nike Air technology absorbs impact cushioning with every step.",
                          style: AppTextStyle.paragrapTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            GlassCard(
                              imagePath: '',
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Add to carts',
                                  style: AppTextStyle.categoryTextStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Top cyan
          Container(
            width: double.infinity,
            height: 460,
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: AppColors.lightBlue.withOpacity(0.10),
              // ignore: deprecated_member_use
              border: Border.all(color: AppColors.lightBlue.withOpacity(0.5)),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(250),
                bottomRight: Radius.circular(250),
              ),
            ),
          ),
          // Back button
          Positioned(
            top: 70,
            left: 30,
            child: GlassCard(
              width: 40,
              height: 40,
              imagePath: '',
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.backgroundLight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: 30,
            child: GlassCard(
              width: 40,
              height: 40,
              imagePath: '',
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.favorite, color: AppColors.backgroundLight),
              ),
            ),
          ),
          // Product images
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            bottom: 500,
            child: Column(
              children: [
                Expanded(
                  child: Obx(() {
                    int index = controller.currentIndex.value;
                    if (index >= images!.length) index = 0;
                    return Image.asset(images![index], fit: BoxFit.contain);
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => controller.previousImage(images!.length),
                      icon: GlassCard(
                        width: 40,
                        height: 40,
                        imagePath: '',
                        child: Icon(
                          Icons.arrow_left,
                          color: AppColors.backgroundLight,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => controller.nextImage(images!.length),
                      icon: GlassCard(
                        width: 40,
                        height: 40,
                        imagePath: '',
                        child: Icon(
                          Icons.arrow_right,
                          color: AppColors.backgroundLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
