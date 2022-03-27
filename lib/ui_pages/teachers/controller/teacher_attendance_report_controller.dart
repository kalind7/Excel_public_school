import 'package:get/get.dart';
import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/ui_pages/teachers/models/teacher_attendance_list_report.dart';

class TeacherReportController extends GetxController{

  var isLoading = false.obs;
  var teacherReportList = <Attendance>[].obs;
  var newData  = {
    "class":11,
    "section":1,
    "month":"01",
    "year":"2078"
  };

  Future getTeacherReportList(data)async{

    isLoading.value = true;
    var response = await ApiServices().post(ApiUrl.teacherReportList, data);
    print(response);
    var res = teacherReportFromJson(response);
    print(res);

    if(res.success){
      teacherReportList.value = res.data.attendances;
      print(teacherReportList);
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getTeacherReportList(newData);
    super.onInit();
  }


}