import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/core/utils/responsive.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/controller/product_search_controller.dart';
import 'package:e_commerces/modules/home/model/products_detail_model.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final controller = Get.put(ProductSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
            top: 75,
            left: 10,
            right: 10,
            child: Obx(() {
              return GlassCard(
                width: 400,
                height: 50,
                imagePath: '',
                child: Row(
                  children: [
                     SizedBox(width: 10),
                     Icon(Icons.search,
                        color: AppColors.backgroundLight),
                     SizedBox(width: 10),

                    controller.isSearching.value
                        ? Expanded(
                            child: TextField(
                              autofocus: true,
                              style:  TextStyle(color: Colors.white),
                              onChanged: controller.search,
                              decoration:  InputDecoration(
                                hintText: "Search products...",
                                hintStyle:
                                    TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: controller.startSearch,
                            child: Text(
                              "Search...",
                              style: AppTextStyle.categoryTextStyle,
                            ),
                          ),
                    if (controller.isSearching.value)
                      IconButton(
                        onPressed: controller.clearSearch,
                        icon:  Icon(Icons.close, color: Colors.white),
                      ),
                  ],
                ),
              );
            }),
          ),
          Positioned(
            top: 140,
            left: 10,
            right: 10,
            bottom: 10,
            child: Obx(() {
              final query = controller.query.value;
              final results = controller.results;
              if (query.isEmpty) {
                return  Center(
                  child: Text(
                    "Start searching...",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              if (results.isEmpty) {
                return  Center(
                  child: Text(
                    "No results found",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  // ignore: non_constant_identifier_names, non_ant_identifier_names
                  final ProductDetail = results[index];

                  return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockWidth * 3,
                    vertical: SizeConfig.blockHeight * 1.5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product name and price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name ?? 'Unknown Product',
                            style: AppTextStyle.categoryTextStyle.copyWith(
                              fontSize: SizeConfig.blockWidth * 4,
                            ),
                          ),
                          Text(
                            "\$${product.price ?? 0}",
                            style: AppTextStyle.categoryTextStyle.copyWith(
                              fontSize: SizeConfig.blockWidth * 3.5,
                            ),
                          ),
                        ],
                      ),
                      // Add to cart button
                      GestureDetector(
                        onTap: () =>
                            Get.to(() => ProductDetail),
                        child: GlassCard(
                          width: SizeConfig.blockWidth * 12,
                          height: SizeConfig.blockWidth * 12,
                          imagePath: '',
                          child: Icon(
                            Icons.add_shopping_cart,
                            color: AppColors.backgroundLight,
                            size: SizeConfig.blockWidth * 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}