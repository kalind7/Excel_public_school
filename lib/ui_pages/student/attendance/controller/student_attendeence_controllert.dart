import 'package:get/get.dart';
import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/api/api_url.dart';

import 'package:new_project_work/ui_pages/student/attendance/model/student_attendence_model.dart';

class StudentAttendenceViewController extends GetxController {
  // var attendencelist = [].obs;
  var isloading = true.obs;

  var id = 4886;

  var attendencelist = <Attendance>[].obs;

  var year = 2077;
  var month = 06;

  @override
  void onInit() {
    getstudentattencelist(id, year, month);
    super.onInit();
  }

  Future getstudentattencelist(id, year, month) async {
    isloading.value = true;
    var response =
        await ApiServices().get(ApiUrl.studentattendencelist(id, year, month));

    print(response);

    var res = studentAttendanceModelFromJson(response);

    if (res.success) {
      attendencelist.value = res.data!.attendances;
      isloading.value = false;
      print(attendencelist);
      print('Data');
    } else {
      print('data failed');
    }
  }
}
