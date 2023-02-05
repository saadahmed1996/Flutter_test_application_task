import 'dart:io';
import 'package:get/get.dart';

//extending with GetConnect to use getx services like post and get methods

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;
  Map<String, String>? _mainHeaders;

  ApiClient({
    required this.appBaseUrl,
  }) {
    baseUrl = appBaseUrl;
    _mainHeaders = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
  }

  //Get Method
  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
