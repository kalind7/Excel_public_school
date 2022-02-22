import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final Connectivity netConnectivity = Connectivity();

class InternetConnection {
  Future checkInternetConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    // var connectivityResult = await (netConnectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Get.snackbar('Network Error', 'No Internet Connection',
          isDismissible: true,
          icon: Icon(Icons.no_cell),
          snackPosition: SnackPosition.TOP);
      // Alert.showGlobalSnackBar("No Internet Connection.");
      return false;
    } else {
      return true;
    }
  }
}
