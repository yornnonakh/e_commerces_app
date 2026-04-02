import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/controller/products_controller.dart';
import 'package:e_commerces/modules/home/view/widget/cart_item_widget.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:e_commerces/modules/home/view/widget/payments_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingScreen extends StatelessWidget {
  ShoppingScreen({super.key});

  final controller = Get.find<ProductController>();

  @override
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
            padding: EdgeInsets.all(16),
            child: GlassCard(
              imagePath: '',
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    // HEADER
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.backgroundLight,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Shopping Bag",
                          style: AppTextStyle.featureTextStyle,
                        ),
                        Spacer(),
                        GlassCard(
                          imagePath: '',
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: AppColors.backgroundLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Obx(() {
                        if (controller.cartList.isEmpty) {
                          return Center(child: Text("Cart is empty"));
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
                    SizedBox(height: 10),
                    // PROMO
                    Row(
                      children: [
                        Expanded(
                          child: GlassCard(
                            imagePath: '',
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Promo Code",
                                prefixStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GlassCard(
                          imagePath: '',
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Center(
                              child: Text(
                                "Apply",
                                style: AppTextStyle.categoryTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // TOTAL SECTION
                    Obx(() {
                      double subtotal = controller.total;
                      double shipping = 4.99;
                      double total = subtotal + shipping;
                      return Column(
                        children: [
                          buildRow("Subtotal", subtotal),
                          buildRow("Shipping", shipping),
                          Divider(),
                          buildRow("Bag Total", total, isBold: true),
                        ],
                      );
                    }),
                    SizedBox(height: 20),
                    // CHECKOUT BUTTON
                    InkWell(
                      onTap: () {
                        Get.to(() => PaymentScreen());
                      },
                      child: GlassCard(
                        width: double.infinity,
                        height: 60,
                        imagePath: '',
                        child: Center(
                          child: Text(
                            "Proceed To Checkout",
                            style: TextStyle(color: AppColors.backgroundLight),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // helper
  Widget buildRow(String title, double value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyle.categoryTextStyle),
          Text(
            "\$${value.toStringAsFixed(2)}",
            style: AppTextStyle.categoryTextStyle,
          ),
        ],
      ),
    );
  }
}
