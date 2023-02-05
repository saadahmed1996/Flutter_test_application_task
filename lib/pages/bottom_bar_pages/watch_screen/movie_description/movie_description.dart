import 'package:flutter/material.dart';
import 'package:flutter_test_application/controller/watch_movies_controller/watch_movies_controller.dart';
import 'package:flutter_test_application/custom_widgets/big_text.dart';
import 'package:flutter_test_application/custom_widgets/cast_list.dart';
import 'package:flutter_test_application/custom_widgets/small_text.dart';
import 'package:flutter_test_application/routes/router_helper.dart';
import '../../../../custom_widgets/movie_name_and_rating.dart';
import '../../../../custom_widgets/expandable_text_widget.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import 'package:get/get.dart';

class MovieDescription extends StatelessWidget {
  final int pageId;
  MovieDescription({
    super.key,
    required this.pageId,
  });

  @override
  Widget build(BuildContext context) {
    var product = Get.find<WatchMoviesController>().moviesList[pageId];
    return Scaffold(
      backgroundColor: AppColors.mainBlackColor,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: AppDimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "http://image.tmdb.org/t/p/w500${product.backdropPath}"),
                ),
              ),
            ),
          ),
          //back button
          Positioned(
            top: AppDimensions.height45,
            left: AppDimensions.width20,
            right: AppDimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offNamed(RouterHelper.getInitial());
                  },
                  child: Container(
                    height: AppDimensions.height20 * 2,
                    width: AppDimensions.width20 * 2,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radius20 * 2),
                    ),
                    child: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //introduction of the movie
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: AppDimensions.popularFoodImgSize - 100,
            child: Container(
              padding: EdgeInsets.only(
                left: AppDimensions.width20,
                right: AppDimensions.width20,
                top: AppDimensions.height10 / 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppDimensions.radius20),
                  topLeft: Radius.circular(AppDimensions.radius20),
                ),
                color: AppColors.mainBlackColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: AppDimensions.width45 * 3.2,
                      ),
                      //Movie name and rating
                      MovieNameAndRaing(
                        text: product.title.toString(),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimensions.height45),
                  SmallText(
                    text: "Directed by Jordan - Roberts",
                    size: AppDimensions.font16,
                  ),
                  SizedBox(height: AppDimensions.height10 / 2),
                  BigText(text: 'The Cast'),
                  //Cast List
                  CastList(),
                  BigText(text: 'Stroyline'),
                  SizedBox(height: AppDimensions.height10 / 2),
                  //Story Line
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: product.overview.toString(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //Cover Photo
          Positioned(
            top: AppDimensions.height45 * 3.5,
            left: AppDimensions.width20,
            child: Container(
              width: AppDimensions.width45 * 3,
              height: AppDimensions.height45 * 5.2,
              decoration: BoxDecoration(
                color: AppColors.redColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "http://image.tmdb.org/t/p/w500${product.posterPath}"),
                ),
              ),
            ),
          ),
        ],
      ),
      //Floating Resume button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: AppDimensions.width30 * 8,
        height: AppDimensions.height30 * 2,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueAccent.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radius15),
            ),
          ),
          onPressed: () {},
          child: BigText(
            text: "Resume Playing",
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
