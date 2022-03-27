import 'dart:convert';

import 'package:get/get.dart';
import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/ui_pages/teachers/models/student_attendance_list_model.dart';
import 'package:new_project_work/ui_pages/teachers/models/teacher_attendance_list_report.dart';


class TeacherAttendanceController extends GetxController {

  var teacherAttendanceList = <NewStudent>[].obs;
  var studentClassList =  <dynamic>[].obs;
  var studentSectionList = <dynamic>[].obs;
  String  ?selectedSection  ;
  String ? selectedClass ;
  var selectedDate = ''.obs;

  var data = Map<String , String>().obs;

  var note = Map<String, dynamic>().obs;

  RxList idList = [].obs;

  var isLoading = false.obs;

  var newData = {
    "class": 13,
    "section": 1,
    "attendance_date": "2078-11-20",
  };

  var teacherReportList = <Attendance>[].obs;
  var reportData  = {
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

  Future getTeacherAttendanceList(data) async {

     isLoading.value = true;
     var response = await ApiServices().post(ApiUrl.teacherAttendanceList, data);
     // print(response);
     var res = newStudentModelListFromJson(response);
     // print(res);

     if(res.success){
       teacherAttendanceList.value = res.data.newStudents;
       print(teacherAttendanceList);
       isLoading.value = false;
     }else{
       print('no data');
     }
    }


  Future submitTeacherAttendance(data) async {

    var response = await ApiServices().post(ApiUrl.teacherAttendanceSubmit, data);
    // print(response);

    var res = jsonDecode(response);
    if( res['success']){
      print('submitted');
    }else{
      print('no data');
    }
  }

  Future getClasses() async {

    isLoading.value = true;
    var response = await ApiServices().getWithToken(ApiUrl.getClasses);
    // print(response);
    var res = json.decode(response);
    // print(res);

    if(res["status"]){
      studentClassList.value = res["data"]  ;
      print(studentClassList);
      isLoading.value = false;
    }else{
      print('no data');
    }
  }

  Future getSection(classs) async {

    studentSectionList.clear();
    var response = await ApiServices().getWithToken(ApiUrl.getSection(classs));
    // print(response);
    var res = json.decode(response);
    // print(res);

    if(res["status"]){

      studentSectionList.value = res["data"]  ;
      print(studentSectionList);
    }else{
      print('no data');
    }
  }


  @override
  void onInit() {
    getTeacherReportList(reportData);
    getClasses();
    // getSection(9);
    super.onInit();
  }
  }


//import 'package:get/get.dart';
//
//
// class StudentAttendanceDetails {
//   final int roll;
//   final String stdName;
//   bool present;
//   bool absent;
//   bool homework;
//
//   StudentAttendanceDetails(
//       {
//         required this.roll,
//         required this.stdName,
//         required this.present ,
//         required this.absent,
//         required this.homework});
// }
//
//
// class StudentAttendanceController extends GetxController {
//
//   List<StudentAttendanceDetails> list = [
//
//     StudentAttendanceDetails(
//       roll: 1, stdName: 'Kashis KC',present: false,
//       absent: false, homework: false,
//     ),
//     StudentAttendanceDetails(
//       roll: 1, stdName: 'Hari Lal Yadav',present: false,
//       absent: false, homework: false,
//     ),
//     StudentAttendanceDetails(
//       roll: 1, stdName: 'Ram Babu ',present: false,
//       absent: false, homework: false,
//     ),
//     StudentAttendanceDetails(
//       roll: 1, stdName: 'Sita K Thapa',present: false,
//       absent: false, homework: false,
//     ),
//     StudentAttendanceDetails(
//       roll: 1, stdName: 'Radha Krishna',present: false,
//       absent: false, homework: false,
//     ),
//     StudentAttendanceDetails(
//       roll: 1, stdName: 'Shiva Parvati',present: false,
//       absent: false, homework: false,
//     ),
//     StudentAttendanceDetails(
//       roll: 1, stdName: 'Bishnu Koirala',present: false,
//       absent: false, homework: false,
//     ),
//     StudentAttendanceDetails(
//       roll: 1, stdName: 'Brahma Hero',present: false,
//       absent: false, homework: false,
//     ),
//     StudentAttendanceDetails(
//       roll: 1, stdName: 'Balram Khatri',present: false,
//       absent: false, homework: false,
//     ),
//     StudentAttendanceDetails(
//       roll: 1, stdName: 'Basu P Bista',present: false,
//       absent: false, homework: false,
//     ),
//   ];
//
//
//
//   var studentAttendanceList = <StudentAttendanceDetails>[].obs;
//   var isLoading = true.obs;
//   // var checkbool = false.obs;
//
//   @override
//   void onInit() {
//     getDetails();
//     super.onInit();
//   }
//
//   // void myFunc(){
//   //   print('isWorking');
//   //   checkbool.value = !checkbool.value;
//   //   // value(!value.value);
//   // }
//
//   void getDetails()async {
//     isLoading.value = true;
//     await Future.delayed(Duration(seconds: 3));
//
//     studentAttendanceList.value = list;
//
//     isLoading.value = false;
//   }
// }
