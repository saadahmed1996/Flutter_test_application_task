import 'package:flutter/material.dart';

import '../../../custom_widgets/big_text.dart';
import '../../../utils/app_colors.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldMainBlackColor,
      body: Center(
        child: BigText(text: "Reels Page"),
      ),
    );
  }
}
