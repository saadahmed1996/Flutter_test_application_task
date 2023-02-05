import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_application/pages/bottom_bar_pages/news_screen/news_page.dart';
import 'package:flutter_test_application/pages/bottom_bar_pages/reels_screen/reels_page.dart';
import 'package:flutter_test_application/pages/bottom_bar_pages/watch_screen/watch_page.dart';
import '../controller/bottom_bar_controller/bottom_bar_controller.dart';
import '../utils/app_colors.dart';
import 'bottom_bar_pages/download_screen/download_page.dart';
import 'bottom_bar_pages/home_screen/home_page.dart';
import 'package:get/get.dart';

class MainBottomBar extends StatefulWidget {
  const MainBottomBar({Key? key}) : super(key: key);

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(builder: (bottomBarController) {
      return WillPopScope(
        onWillPop: () async {
          final shouldPop = await bottomBarController.showDialogBox();
          return shouldPop ?? false;
        },
        child: Scaffold(
          body: IndexedStack(
            index: bottomBarController.tabIndex,
            children: const [
              HomePage(),
              WatchPage(),
              NewsPage(),
              ReelsPage(),
              DonwloadsPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black87,
            selectedItemColor: AppColors.redColor,
            unselectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            currentIndex: bottomBarController.tabIndex,
            onTap: bottomBarController.changeTabIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_collection,
                ),
                label: 'Watch',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.newspaper,
                ),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_call,
                ),
                label: 'Reels',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.download,
                ),
                label: 'Downloads',
              ),
            ],
          ),
        ),
      );
    });
  }
}
