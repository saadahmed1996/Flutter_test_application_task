import 'package:flutter/material.dart';
import 'package:flutter_test_application/controller/watch_movies_controller/watch_movies_controller.dart';
import 'package:flutter_test_application/custom_widgets/big_text.dart';
import 'package:flutter_test_application/routes/router_helper.dart';
import 'package:flutter_test_application/utils/app_colors.dart';
import '../../../custom_widgets/card_list.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/responsive_size_and_text.dart';
import 'package:get/get.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({super.key});

  Future<void> loadResources() async {
    await Get.find<WatchMoviesController>().getAllMoviesList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: loadResources,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldMainBlackColor,
        appBar: AppBar(
          backgroundColor: AppColors.mainBlackColor,
          leading: const Icon(Icons.menu),
          title: BigText(
            text: 'Watch',
            color: Colors.white,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: SizedBox(
            width: Responsive.width(100, context),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Image
                  Container(
                    height: AppDimensions.screenHeight * 0.35,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/cover.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //Heading
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: AppDimensions.width20,
                        vertical: AppDimensions.height20,
                      ),
                      child: BigText(
                        text: "Watch Movies",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //List Page
                  GetBuilder<WatchMoviesController>(builder: (controller) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: AppDimensions.height45 * 6,
                        margin: EdgeInsets.only(
                          left: AppDimensions.width20,
                          bottom: AppDimensions.height20,
                        ),
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.moviesList.length + 1,
                          scrollDirection: Axis.horizontal,
                          controller: controller.scrollControllerForMoviesList,
                          itemBuilder: (context, index) {
                            if (index < controller.moviesList.length) {
                              var data = controller.moviesList[index];
                              return InkWell(
                                onTap: () {
                                  Get.offNamed(
                                    RouterHelper.getMovieDescription(index),
                                  );
                                },
                                child: Card(
                                  color: Colors.black87,
                                  child: CustomCardList(
                                    imageLink: data.posterPath!.isNotEmpty
                                        ? "http://image.tmdb.org/t/p/w500${data.posterPath}"
                                        : 'https://via.placeholder.com/200x250',
                                    itemName: data.title.toString(),
                                    releaseDate: data.releaseDate.toString(),
                                  ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppDimensions.height10,
                                  horizontal: AppDimensions.width10,
                                ),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
