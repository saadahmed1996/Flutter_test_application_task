import 'package:flutter/material.dart';
import 'package:flutter_test_application/custom_widgets/small_text.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import 'big_text.dart';

class MovieNameAndRaing extends StatelessWidget {
  final String text;
  const MovieNameAndRaing({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: AppDimensions.width45 * 3.5,
          child: BigText(
            text: text,
            size: AppDimensions.font20,
          ),
        ),
        SizedBox(
          height: AppDimensions.height10,
        ),
        Container(
          width: AppDimensions.width45,
          height: AppDimensions.height20,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.white,
              width: 1.0,
            ),
          ),
          child: Center(
            child: SmallText(text: '-12'),
          ),
        ),
        SizedBox(
          height: AppDimensions.height10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: List.generate(
                4,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.ratingStarColor,
                  size: 15,
                ),
              ),
            ),
            SizedBox(width: 10),
            SmallText(text: '2017 - Adventure'),
            SizedBox(width: 10),
            SmallText(text: '2 hr 09 min'),
          ],
        ),
      ],
    );
  }
}
