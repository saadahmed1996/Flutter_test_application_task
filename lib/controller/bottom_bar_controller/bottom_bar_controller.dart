import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  var tabIndex = 1;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  //Dialog Box funtion to exit from application.
  Future showDialogBox() => showDialog(
        context: Get.context!,
        builder: ((context) => AlertDialog(
              title: Text("Do you want to exit?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text("Cancel")),
                TextButton(
                  onPressed: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      exit(0);
                    }
                  },
                  child: Text("Yes"),
                )
              ],
            )),
      );
}
