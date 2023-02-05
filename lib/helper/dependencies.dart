import 'package:flutter_test_application/controller/watch_movies_controller/watch_movies_controller.dart';
import 'package:flutter_test_application/data/repository/watch_movies_repo/watch_movies_repo.dart';
import 'package:flutter_test_application/utils/app_constant.dart';
import 'package:get/get.dart';
import '../controller/bottom_bar_controller/bottom_bar_controller.dart';
import '../data/api/api_client.dart';

//For Injecting Dependencies into the application.

Future<void> init() async {
  //API CLIENT
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.baseURL), fenix: true);

  //REPOSSITORIES
  Get.lazyPut(() => WatchMoviesRepository(apiClient: Get.find()), fenix: true);

  //CONTROLLERS
  Get.lazyPut(() => BottomBarController(), fenix: true);
  Get.lazyPut(() => WatchMoviesController(watchMoviesRepository: Get.find()),
      fenix: true);
}
