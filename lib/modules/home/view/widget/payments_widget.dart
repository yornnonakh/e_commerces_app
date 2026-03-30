import 'package:e_commerces/app/config/app_assets.dart';
import 'package:e_commerces/app/theme/app_colors.dart';
import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:e_commerces/modules/home/view/widget/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headers,
                SizedBox(height: 20),
                _shippingSection,
                SizedBox(height: 20),
                _paymentMethods,
                SizedBox(height: 20),
                _cardPreview,
                Spacer(),
                _confirmButton,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackground({required Widget child}) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.backgroundcover),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
Row get _headers {
  return Row(
    children: [
      IconButton(
        onPressed: Get.back,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.backgroundLight,
        ),
      ),
      const SizedBox(width: 10),
      Text("Payment Method", style: AppTextStyle.heading),
    ],
  );
}


Column get _shippingSection {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Shipping to",
          style: TextStyle(color: AppColors.backgroundLight),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Text("Home\n1470 Cedar Lane"),
        ),
      ],
    );
}

Column get _paymentMethods {
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Payment Method",
          style: TextStyle(color: AppColors.backgroundLight),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.credit_card, color: AppColors.backgroundLight),
            SizedBox(width: 15),
            Icon(Icons.apple, color: AppColors.backgroundLight),
            SizedBox(width: 15),
            Icon(Icons.g_mobiledata, color: AppColors.backgroundLight),
          ],
        ),
      ],
    );
}

Container get _cardPreview {
  return Container(
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Credit Card", style: TextStyle(color: Colors.white)),
          Spacer(),
          Text(
            "4315 0245 448 0345",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 10),
          Text("CARD HOLDER", style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }


Center get _confirmButton {
  return Center(
    child: GlassCard(
      width: 300,
      height: 60,
      imagePath: '',
      child: Center(
        child: Text('Confirm Order', style: AppTextStyle.categoryTextStyle),
      ),
    ),
  );
}
