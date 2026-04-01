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
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey.shade200,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              // HEADER
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Spacer(),
                  const Text(
                    "Shopping Bag",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Icon(Icons.shopping_bag_outlined),
                ],
              ),

              const SizedBox(height: 10),

              // CART LIST
              Expanded(
                child: Obx(() {
                  if (controller.cartList.isEmpty) {
                    return const Center(child: Text("Cart is empty"));
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

              const SizedBox(height: 10),

              // PROMO
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Promo Code",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Apply"),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // TOTAL SECTION
              Obx(() {
                double subtotal = controller.total;
                double shipping = 4.99;
                double total = subtotal + shipping;

                return Column(
                  children: [
                    buildRow("Subtotal", subtotal),
                    buildRow("Shipping", shipping),
                    const Divider(),
                    buildRow("Bag Total", total, isBold: true),
                  ],
                );
              }),

              const SizedBox(height: 20),

              // CHECKOUT BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => PaymentScreen());
                  },
                  child: const Text(
                    "Proceed To Checkout",
                    style: TextStyle(color: Colors.white),
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

// helper
Widget buildRow(String title, double value, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          "\$${value.toStringAsFixed(2)}",
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
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
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item.image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 10),

          // INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text("\$${item.price}"),
              ],
            ),
          ),

          // QTY + DELETE
          Column(
            children: [
              GestureDetector(
                onTap: () => controller.cartList.removeAt(index),
                child: const Icon(Icons.close, size: 18),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.decreaseQty(index),
                    child: buildCircle(Icons.remove),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text("${item.qty}"),
                  ),
                  GestureDetector(
                    onTap: () => controller.increaseQty(index),
                    child: buildCircle(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCircle(IconData icon) {
    return Container(
      width: 26,
      height: 26,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 14, color: Colors.white),
    );
  }
}