import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/global/alert.dart';
import 'package:new_project_work/models/student/student_model.dart';
import 'package:new_project_work/route/router_constant.dart';


class LoginDataController extends GetxController {
  var loginDetails = <Welcome>[].obs;
  var isloading = false.obs;

  Future login(data) async {

    isloading.value = true;
    var response = await ApiServices().post(ApiUrl.login, data);
    print(response);
    var res = welcomeFromJson(response);
    print(res);
    if (res.success) {
      await Hive.openBox(Constants.APPNAME);
      var box = Hive.box(Constants.APPNAME);
      box.put(Constants.accesstoken, res.data?.token);
      box.put(Constants.name, res.data?.user.fullName);
      box.put(Constants.roll, res.data?.user.roleId);
      box.put(Constants.userId, res.data?.user.id);
      box.put(Constants.email, res.data?.user.email);

      print(box.get(Constants.accesstoken.toString()));
      box.put(Constants.isLoggedIn, true);
      isloading.value = false;
      var roll = box.get(Constants.roll);
      if (roll == 2) {
        box.put(Constants.className, res.data!.userDetails.className);
        box.put(Constants.sectionName, res.data!.userDetails.sectionName);
        box.put(Constants.admissionNumber, res.data!.userDetails.admissionNo);
        Get.offNamed(studentLandingPage);
      } else {
        box.put(Constants.mobile, res.data!.userDetails.mobile.toString());
        box.put(Constants.currentAddress, res.data!.userDetails.currentAddress);
        box.put(Constants.experience, res.data!.userDetails.experience);
        box.put(Constants.qualification, res.data!.userDetails.qualification);
        box.put(Constants.dateOfBirth, res.data!.userDetails.dateOfBirth.toString());
        box.put(Constants.dateOfJoining, res.data!.userDetails.dateOfJoining);
        Get.offNamed(teacherLandingPage);
      }
    } else {
      Alert.showSnackBar(
          title: 'Wrong Credentials', message: res.message, top: false);
    }
  }
}
//import 'dart:developer';
//
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:new_project_work/api/ApiServices.dart';
// import 'package:new_project_work/api/api_url.dart';
// import 'package:new_project_work/global/alert.dart';
// import 'package:new_project_work/models/student/student_model.dart';
// import 'package:new_project_work/route/router_constant.dart';
// import 'package:new_project_work/ui_pages/student/landing/student_landing_page.dart';
// import 'package:new_project_work/ui_pages/teachers/home_page/teacher_landing_page.dart';
//
// class LoginDataController extends GetxController {
//   var loginDetails = <Welcome>[].obs;
//   var isloading = false.obs;
//
//   Future login(data) async {
//     isloading.value = true;
//
//     var response = await ApiServices().post(ApiUrl.login, data);
//     var res = welcomeFromJson(response);
//     if (res.success) {
//       await Hive.openBox(Constants.APPNAME);
//       var box = Hive.box(Constants.APPNAME);
//       box.put(Constants.accesstoken, res.data?.token);
//       box.put(Constants.name, res.data?.user.fullName);
//       box.put(Constants.userId, res.data?.user.id);
//       box.put(Constants.email, res.data?.user.email);
//       print(box.get(Constants.accesstoken.toString()));
//       box.put(Constants.isLoggedIn, true);
//       isloading.value = false;
//       var roll = box.get(Constants.roll);
//       if (roll == 2) {
//         box.put(Constants.roll, res.data?.user.roleId);
//         box.put(Constants.className, res.data!.userDetails.className);
//         box.put(Constants.sectionName, res.data!.userDetails.sectionName);
//         box.put(Constants.admissionNumber, res.data!.userDetails.admissionNo);
//         Get.offNamed(studentLandingPage);
//       } else {
//         box.put(Constants.currentAddress, res.data!.userDetails.currentAddress);
//         box.put(Constants.experience, res.data!.userDetails.experience);
//         box.put(Constants.qualification, res.data!.userDetails.qualification);
//         box.put(Constants.dateOfBirth, res.data!.userDetails.dateOfBirth);
//         box.put(Constants.dateOfJoining, res.data!.userDetails.dateOfJoining.toString());
//         Get.offNamed(teacherLandingPage);
//       }
//     } else {
//       Alert.showSnackBar(
//           title: 'Wrong Credentials', message: res.message, top: false);
//     }
//   }
// }