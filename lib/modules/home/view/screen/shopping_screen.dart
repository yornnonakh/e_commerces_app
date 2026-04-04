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
            child: Column(
              children: [
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
                    Text("Shopping Bag", style: AppTextStyle.featureTextStyle),
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
                  child: GlassCard(
                    imagePath: '',
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Expanded(
                            child: Obx(() {
                              if (controller.cartList.isEmpty) {
                                return Center(
                                  child: Text(
                                    'Cart is empty',
                                    style: AppTextStyle.textStyleSmbold,
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
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: GlassCard(
                                  imagePath: '',
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Promo Code",
                                      hintStyle: TextStyle(
                                        color: AppColors.grey300,
                                      ),
                                      border: OutlineInputBorder(
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
                                  child: Text(
                                    "Apply",
                                    style: AppTextStyle.categoryTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Obx(() {
                            double subtotal = controller.total;
                            double shipping = 4.99;
                            double total = subtotal + shipping;

                            return Column(
                              children: [
                                buildRow("Subtotal", subtotal),
                                buildRow("Shipping", shipping),
                                Divider(color: AppColors.backgroundLight),
                                buildRow("Bag Total", total, isBold: true),
                              ],
                            );
                          }),
                          SizedBox(height: 20),
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
                                  style: AppTextStyle.categoryTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(String title, double value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyle.textStyleMdbold),
          Text(
            "\$${value.toStringAsFixed(2)}",
            style: AppTextStyle.categoryTextStyle,
          ),
        ],
      ),
    );
  }
}
