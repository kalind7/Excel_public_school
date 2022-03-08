import 'package:get/get.dart';
import 'package:new_project_work/api/ApiServices.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/models/student_names_model.dart';



class TeacherAttendanceController extends GetxController {

  var teacherAttendanceList = <NewStudent>[].obs;
  var isLoading = false.obs;

  var newData = {
    "class": 13,
    "section": 1,
    "attendance_date": "2078-11-20",
  };

  Future getTeacherAttendanceList(data) async {

     isLoading.value = true;
     var response = await ApiServices().post(ApiUrl.teacherAttendanceList, data);
     print(response);

     var res = newStudentModelListFromJson(response);

     print(res);

     if(res.success){
       teacherAttendanceList.value = res.data.newStudents;
       print(teacherAttendanceList);

       isLoading.value = false;
     }else{
       print('no data');
     }
    }

    @override
  void onInit() {
    getTeacherAttendanceList(newData);
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
