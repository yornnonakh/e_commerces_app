import 'package:e_commerces/app/theme/app_text_style.dart';
import 'package:flutter/widgets.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('Fllow Us', style: AppTextStyle.heading)],
    );
  }
}
