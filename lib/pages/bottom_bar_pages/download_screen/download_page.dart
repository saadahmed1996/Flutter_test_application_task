import 'package:flutter/material.dart';
import '../../../custom_widgets/big_text.dart';
import '../../../utils/app_colors.dart';

class DonwloadsPage extends StatelessWidget {
  const DonwloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldMainBlackColor,
      body: Center(
        child: BigText(text: "Downloads Page"),
      ),
    );
  }
}
