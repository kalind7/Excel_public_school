import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/global/alert.dart';
import 'package:new_project_work/models/student/student_model.dart';
import 'package:new_project_work/route/router_constant.dart';

import 'package:new_project_work/ui_pages/list_of_students.dart';

class LoginDataController extends GetxController {
  var loginDetails = <Welcome>[].obs;
  var isloading = false.obs;

  Future login(data) async {
    isloading.value = true;

    var response = await ApiServices().post(ApiUrl.login, data);

    // var res = j

    // var res = Welcome.fromJson(jsonDecode(response));
    var res = welcomeFromJson(response);
    // var res = jsonDecode(response);

    // print(res['success']);

    if (res.success) {
      await Hive.openBox(Constants.APPNAME);
      var box = Hive.box(Constants.APPNAME);
      box.put(Constants.name, res.data?.user.fullName);
      box.put(Constants.roll, res.data?.user.roleId);
      box.put(Constants.userId, res.data?.user.id);

      /*if (res.data!.phoneVerify == 0) {
          Routes.navigateToOtpScreen(context,userName);
        } else {
          box.put(Constants.isLoggedIn, true);
          Routes.navigateToDashboardScreen(context,0);
        }*/
      box.put(Constants.isLoggedIn, true);
      isloading.value = false;
      var roll = box.get(Constants.roll);
      // log(roll.toString());
      roll == 2 ? Get.offNamed(studentDashBoard) : Get.off(StudentLists());
    } else {
      Alert.showSnackBar(res.message, true);
    }
  }
}
