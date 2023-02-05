import 'package:get/get.dart';
import '../../../utils/app_constant.dart';
import '../../api/api_client.dart';

class WatchMoviesRepository extends GetxService {
  final ApiClient apiClient;
  WatchMoviesRepository({required this.apiClient});

  //Login Post Repo
  Future<Response> getAllMoviesListRepo(int pageNo) async {
    String url = "${AppConstant.apiKey}&page=$pageNo";
    return await apiClient.getData(AppConstant.moviesListEndPoint + url);
  }
}
