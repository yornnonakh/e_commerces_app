import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/controller/products_controller.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CartItem extends StatelessWidget {
  final dynamic item;
  final int index;

  CartItem({super.key, required this.item, required this.index});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      imagePath: '',
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Row(
          children: [
            ClipRRect(
              child: Image.asset(
                item.image,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            // INFO
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: AppTextStyle.categoryTextStyle,
                  ),
                  SizedBox(height: 4),
                  Text("\$${item.price}",style: AppTextStyle.categoryTextStyle,),
                ],
              ),
            ),

            // QTY + DELETE
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: GestureDetector(
                    onTap: () => controller.cartList.removeAt(index),
                    child: Icon(
                      Icons.close,
                      size: 25,
                      color: AppColors.backgroundLight,
                    ),
                  ),
                ),
                SizedBox(height: 45),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.decreaseQty(index),
                      child: buildCircle(Icons.remove),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "${item.qty}",
                        style: TextStyle(color: AppColors.backgroundLight),
                      ),
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
      ),
    );
  }
}

Widget buildCircle(IconData icon) {
  return GlassCard(
    width: 30,
    height: 30,
    imagePath: '',
    child: Icon(icon, size: 14, color: AppColors.backgroundLight),
  );
}
