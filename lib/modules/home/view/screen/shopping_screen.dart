import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/controller/products_controller.dart';
import 'package:e_commerces/modules/home/model/products_detail_model.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:e_commerces/modules/home/view/widget/payments_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingScreen extends StatelessWidget {
  ShoppingScreen({super.key});

  final controller = Get.find<ProductController>();

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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.backgroundLight,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text("Shopping Bag", style: AppTextStyle.buttonTextStyle),
                  ],
                ),

                const SizedBox(height: 20),

                // ✅ CART ITEMS (DYNAMIC)
                Expanded(
                  child: Obx(() {
                    if (controller.cartList.isEmpty) {
                      return Center(
                        child: Text(
                          "Cart is empty",
                          style: AppTextStyle.categoryTextStyle,
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: controller.cartList.length,
                      itemBuilder: (context, index) {
                        var item = controller.cartList[index];

                        return CartItem(item: item, index: index);
                      },
                    );
                  }),
                ),

                // Promo
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Promo Code",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Apply"),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ✅ TOTAL (DYNAMIC)
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bag Total", style: AppTextStyle.categoryTextStyle),
                      Text(
                        "\$${controller.total}",
                        style: AppTextStyle.categoryTextStyle,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => PaymentScreen());
                    },
                    child: const Text("Proceed To Checkout"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final dynamic item;
  final int index;

  CartItem({super.key, required this.item, required this.index});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GlassCard(
        imagePath: '',
        child: Row(
          children: [
            // ✅ Image (ONLY ONE)
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset("${item.image}"),
            ),
            const SizedBox(width: 10),

            // ✅ Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: AppTextStyle.categoryTextStyle),
                    Text(
                      "\$${item.price}",
                      style: AppTextStyle.categoryTextStyle,
                    ),
                  ],
                ),
              ),
            ),

            // ✅ QTY CONTROL
            Row(
              children: [
                IconButton(
                  onPressed: () => controller.decreaseQty(index),
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: AppColors.danger,
                  ),
                ),

                // ❗ NO NEED Obx HERE
                Text("${item.qty}", style: AppTextStyle.categoryTextStyle),

                IconButton(
                  onPressed: () => controller.increaseQty(index),
                  icon: Icon(Icons.add_circle_outline, color: AppColors.accent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
