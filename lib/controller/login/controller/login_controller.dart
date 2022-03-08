import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/global/alert.dart';
import 'package:new_project_work/models/student/student_model.dart';
import 'package:new_project_work/route/router_constant.dart';
import 'package:new_project_work/ui_pages/student/landing/student_landing_page.dart';

class LoginDataController extends GetxController {
  var loginDetails = <Welcome>[].obs;
  var isloading = false.obs;

  Future login(data) async {
    isloading.value = true;

    var response = await ApiServices().post(ApiUrl.login, data);
    var res = welcomeFromJson(response);
    if (res.success) {
      await Hive.openBox(Constants.APPNAME);
      var box = Hive.box(Constants.APPNAME);
      box.put(Constants.accesstoken, res.data?.token);
      box.put(Constants.name, res.data?.user.fullName);
      box.put(Constants.roll, res.data?.user.roleId);
      box.put(Constants.userId, res.data?.user.id);
      box.put(Constants.email, res.data?.user.email);
      box.put(Constants.className, res.data!.userDetails.className);
      box.put(Constants.sectionName, res.data!.userDetails.sectionName);
      box.put(Constants.admissionNumber, res.data!.userDetails.admissionNo);

      print(box.get(Constants.accesstoken.toString()));
      box.put(Constants.isLoggedIn, true);
      isloading.value = false;
      var roll = box.get(Constants.roll);
      if (roll == 2) {
        Get.offNamed(studentLandingPage);
      } else {
        Get.off(StudentLandingPage());
      }
    } else {
      Alert.showSnackBar(
          title: 'Wrong Credentials', message: res.message, top: false);
    }
  }
}
