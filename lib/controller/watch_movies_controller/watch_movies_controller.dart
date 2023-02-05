import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test_application/data/repository/watch_movies_repo/watch_movies_repo.dart';
import 'package:flutter_test_application/models/movies_model.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class WatchMoviesController extends GetxController {
  final WatchMoviesRepository watchMoviesRepository;
  WatchMoviesController({required this.watchMoviesRepository});
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  List<Results> _moviesList = [];
  List<Results> get moviesList => _moviesList;

  //Scroll Controller For All Featured Products List
  final ScrollController _scrollControllerForMoviesList = ScrollController();
  ScrollController get scrollControllerForMoviesList =>
      _scrollControllerForMoviesList;

  //Initial Page No
  int _pageNo = 1;
  int get pageNo => _pageNo;

  var data = RxList<dynamic>();

  @override
  onInit() {
    _moviesList = [];
    _scrollControllerForMoviesList.addListener(() {
      fetchMoreDataFromgetAllMovies();
    });
    getAllMoviesList();
    super.onInit();
  }

  @override
  void dispose() {
    _scrollControllerForMoviesList.dispose();
    super.dispose();
  }

  Future<void> getAllMoviesList() async {
    _isLoaded = true;
    update();
    try {
      Response response =
          await watchMoviesRepository.getAllMoviesListRepo(_pageNo);
      if (response.statusCode == 200) {
        var res = MoviesModel.fromJson(response.body);
        _moviesList += res.results!;
        _isLoaded = false;
        update();
      } else {
        update();
        _isLoaded = false;
        AwesomeDialog(
          context: Get.context!,
          headerAnimationLoop: false,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Error',
          desc: '${jsonDecode(response.bodyString.toString())['message']}',
        ).show();
      }
    } catch (e) {
      AwesomeDialog(
        context: Get.context!,
        headerAnimationLoop: false,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Check your internet connection & reload your app',
      ).show();
    }
  }

  //For Infinite Scrolling
  Future<void> fetchMoreDataFromgetAllMovies() async {
    if (_scrollControllerForMoviesList.position.pixels ==
        _scrollControllerForMoviesList.position.maxScrollExtent) {
      _pageNo = _pageNo + 1;
      getAllMoviesList();
    } else {}
  }
}
