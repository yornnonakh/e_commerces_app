import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/controller/product_search_controller.dart';
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
          /// 🌄 BACKGROUND
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

          /// 🔍 SEARCH BAR (FIXED)
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
                    const SizedBox(width: 10),
                    const Icon(Icons.search,
                        color: AppColors.backgroundLight),
                    const SizedBox(width: 10),

                    /// 🔥 SWITCH BETWEEN TEXT & INPUT
                    controller.isSearching.value
                        ? Expanded(
                            child: TextField(
                              autofocus: true,
                              style: const TextStyle(color: Colors.white),
                              onChanged: controller.search,
                              decoration: const InputDecoration(
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
                              style: AppTextStyle.buttonTextStyle,
                            ),
                          ),

                    /// ❌ CLEAR BUTTON
                    if (controller.isSearching.value)
                      IconButton(
                        onPressed: controller.clearSearch,
                        icon: const Icon(Icons.close, color: Colors.white),
                      ),
                  ],
                ),
              );
            }),
          ),

          /// 📦 RESULT LIST
          Positioned(
            top: 140,
            left: 10,
            right: 10,
            bottom: 10,
            child: Obx(() {
              final query = controller.query.value;
              final results = controller.results;

              if (query.isEmpty) {
                return const Center(
                  child: Text(
                    "Start searching...",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              if (results.isEmpty) {
                return const Center(
                  child: Text(
                    "No results found",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final item = results[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GlassCard(
                      width: double.infinity,
                      height: 60,
                      imagePath: '',
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          const Icon(Icons.shopping_bag,
                              color: Colors.white),
                          const SizedBox(width: 15),
                          Text(
                            item,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
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