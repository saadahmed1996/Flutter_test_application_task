import 'package:flutter/material.dart';
import '../utils/app_dimensions.dart';

class CastList extends StatelessWidget {
  const CastList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height45 * 1.8,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.all(AppDimensions.height10),
                width: AppDimensions.width30 * 2,
                height: AppDimensions.width30 * 2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 5),
                      blurRadius: 15,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage("assets/images/cast$index.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
