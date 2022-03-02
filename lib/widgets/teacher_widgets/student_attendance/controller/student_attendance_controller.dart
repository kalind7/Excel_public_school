
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
        roll: 1, stdName: 'Name 1',present: true,
        absent: false, homework: true,
    ),
    StudentAttendanceDetails(
      roll: 1, stdName: 'Name 1',present: true,
      absent: false, homework: true,
    ),
    StudentAttendanceDetails(
      roll: 1, stdName: 'Name 1',present: true,
      absent: false, homework: true,
    ),
    StudentAttendanceDetails(
      roll: 1, stdName: 'Name 1',present: true,
      absent: false, homework: true,
    ),
    StudentAttendanceDetails(
      roll: 1, stdName: 'Name 1',present: true,
      absent: false, homework: true,
    ),
    StudentAttendanceDetails(
      roll: 1, stdName: 'Name 1',present: true,
      absent: false, homework: true,
    ),
    StudentAttendanceDetails(
      roll: 1, stdName: 'Name 1',present: true,
      absent: false, homework: true,
    ),
    StudentAttendanceDetails(
      roll: 1, stdName: 'Name 1',present: true,
      absent: false, homework: true,
    ),
    StudentAttendanceDetails(
      roll: 1, stdName: 'Name 1',present: true,
      absent: false, homework: true,
    ),
    StudentAttendanceDetails(
      roll: 1, stdName: 'Name 1',present: true,
      absent: false, homework: true,
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
