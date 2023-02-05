import 'package:flutter/material.dart';
import 'package:flutter_test_application/custom_widgets/small_text.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import 'big_text.dart';

class CustomCardList extends StatelessWidget {
  CustomCardList({
    super.key,
    this.imageLink,
    required this.itemName,
    required this.releaseDate,
  });

  String? imageLink;
  String itemName;
  String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.screenHeight / 3,
      width: AppDimensions.screenWidth / 3,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          //Image Container
          SizedBox(
            height: AppDimensions.height45 * 4,
            width: AppDimensions.width30 * 6,
            child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              placeholder: 'assets/images/loader.gif',
              image: imageLink ?? "https://via.placeholder.com/200x250",
            ),
          ),
          //Item Name
          Positioned(
            bottom: AppDimensions.height20,
            left: AppDimensions.width10 / 2,
            child: SizedBox(
              width: 120,
              child: BigText(
                overflow: TextOverflow.ellipsis,
                text: itemName,
                size: AppDimensions.font16,
                color: Colors.white,
              ),
            ),
          ),
          //Dates
          Positioned(
            bottom: AppDimensions.height10 / 2,
            left: AppDimensions.width10 / 2,
            child: SizedBox(
              width: 120,
              child: BigText(
                overflow: TextOverflow.ellipsis,
                text: releaseDate,
                size: AppDimensions.font26 / 2,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
