import 'package:get/get.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/api/api_url.dart';

import 'package:new_project_work/ui_pages/student/attendance/model/student_attendence_model.dart';

class StudentAttendenceViewController extends GetxController {
  // var attendencelist = [].obs;
  var isloading = true.obs;

  var id = 4886;

  var attendencelist = <Attendance>[].obs;
 Rx<Details> detaillist = Details(p: 0, l: 0, a: 0, h: 0, f: 0).obs;

  var year = NepaliDateTime.now().year;
  var month = NepaliDateTime.now().month;

  @override
  void onInit() {
    getstudentattencelist(year, month);
    print(year.toString());
    print(month.toString());
    super.onInit();
  }

  Future getstudentattencelist(year, month) async {
    attendencelist.clear();
    isloading.value = true;
    var response = await ApiServices()
        .getWithToken(ApiUrl.studentattendencelist(year, month));

    print(response);

    var res = studentAttendanceModelFromJson(response);

    if (res.success) {
      attendencelist.value = res.data.attendances;
      detaillist.value = res.data.details;

      isloading.value = false;
      print(attendencelist);
      print('Data');
    } else {
      print('data failed');
    }
  }
}
