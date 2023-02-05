import 'package:flutter/material.dart';

import '../../../custom_widgets/big_text.dart';
import '../../../utils/app_colors.dart';
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldMainBlackColor,
      body: Center(
        child: BigText(text:"News Page"),
      ),
    );
  }
}
