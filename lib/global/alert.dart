import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/main.dart';

import 'AppColors.dart';

class Alert {
  static void showSnackBar({title, message,  top}) {
    Get.snackbar(title, message,
        isDismissible: true,
        // icon: Icon(Icons.no_cell),
        snackPosition: top ==true ? SnackPosition.TOP : SnackPosition.BOTTOM);
    // final snackBar = SnackBar(
    //     content: Text(
    //       mesage,
    //       style: TextStyle(fontWeight: FontWeight.w400),
    //     ),
    //     backgroundColor: AppColors.primaryColor,
    //     action: SnackBarAction(
    //       label: 'Close',
    //       textColor: AppColors.orange,
    //       onPressed: () {
    //         ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //       },
    //     ));
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  exitornot() {
    Get.defaultDialog(
      title: '',
      content: const Text('Do you want to exit the App?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => exit(0),
          child: const Text('Yes'),
        )
      ],
    );
  }

  static Future<void> showGlobalSnackBar(mesage) async {
    final context = navigatorKey.currentContext!;
    final snackBar = SnackBar(
        content: Text(
          mesage,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: AppColors.primaryColor,
        action: SnackBarAction(
          label: 'Close',
          textColor: AppColors.orange,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class Keyboard {
  static void closeKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
