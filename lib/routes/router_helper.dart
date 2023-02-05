import 'package:get/get.dart';
import '../pages/bottom_bar_pages/watch_screen/movie_description/movie_description.dart';
import '../pages/main_bottom_bar.dart';
import '../pages/splash_page/splash_page.dart';

//Giving route name for each page and specific name for end route which will manage our app state.

//Route Names
class RouterHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String movieDescription = "/movie-description";
  //============================================================================
  //Route links
  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getMovieDescription(int pageId) =>
      '$movieDescription?pageId=$pageId';
  //============================================================================
  //List of routes in Get Page defined along with their name with a Transition property.
  static List<GetPage> routes = [
    GetPage(
      name: splashPage,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: initial,
      page: () {
        return MainBottomBar();
      },
      transition: Transition.upToDown,
    ),
    GetPage(
      name: movieDescription,
      page: () {
        var pageId = Get.parameters['pageId'];
        return MovieDescription(pageId: int.parse(pageId!));
      },
      transition: Transition.downToUp,
    ),
  ];
}
