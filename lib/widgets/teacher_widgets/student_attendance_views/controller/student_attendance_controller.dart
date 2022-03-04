
import 'package:get/get.dart';


class StudentAttendanceDetails {
  final int roll;
  final String stdName;
   bool present;
   bool absent;
   bool homework;

  StudentAttendanceDetails(
      {
        required this.roll,
        required this.stdName,
        required this.present ,
        required this.absent,
        required this.homework});
}


class StudentAttendanceController extends GetxController {

  List<StudentAttendanceDetails> list = [

    StudentAttendanceDetails(
        roll: 1, stdName: 'Kashis KC',present: false,
        absent: false, homework: false,
    ),
    StudentAttendanceDetails(
      roll: 2, stdName: 'Hari Lal Yadav',present: false,
      absent: false, homework: false,
    ),
    StudentAttendanceDetails(
      roll: 3, stdName: 'Ram Babu ',present: false,
      absent: false, homework: false,
    ),
    StudentAttendanceDetails(
      roll: 4, stdName: 'Sita K Thapa',present: false,
      absent: false, homework: false,
    ),
    StudentAttendanceDetails(
      roll: 5, stdName: 'Radha Krishna',present: false,
      absent: false, homework: true,
    ),
    StudentAttendanceDetails(
      roll: 6, stdName: 'Shiva Parvati',present: false,
      absent: false, homework: false,
    ),
    StudentAttendanceDetails(
      roll: 7, stdName: 'Bishnu Koirala',present: false,
      absent: false, homework: false,
    ),
    StudentAttendanceDetails(
      roll: 8, stdName: 'Brahma Hero',present: false,
      absent: false, homework: false,
    ),
    StudentAttendanceDetails(
      roll: 9, stdName: 'Balram Khatri',present: false,
      absent: false, homework: false,
    ),
    StudentAttendanceDetails(
      roll: 10, stdName: 'Basu P Bista',present: false,
      absent: false, homework: false,
    ),
  ];



  var studentAttendanceList = <StudentAttendanceDetails>[].obs;
  var isLoading = true.obs;
  var checkbool = false.obs;

  @override
  void onInit() {
    getDetails();
    super.onInit();
  }

  void myFunc(){
    print('isWorking');
    checkbool.value = !checkbool.value;
    // value(!value.value);
  }

  void getDetails()async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));

    studentAttendanceList.value = list;

    isLoading.value = false;
  }
}
