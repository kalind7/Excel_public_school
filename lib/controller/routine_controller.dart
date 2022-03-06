import 'package:get/get.dart';
import 'package:new_project_work/models/routine_list.dart';

class RoutineController extends GetxController{
  var routineList = <RoutineDetails>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchDetails();
  }


  void fetchDetails ()async{
    await Future.delayed(Duration(seconds: 1));

    var rouList = [
      RoutineDetails(
        title: 'Fundaments\n'
            'of Mathematics',
        classType: 'Theory Class',
        image: 'images/subjects.jpg',
        subject: 'Subject',
        subjectType: 'Mathematics',
        teacher: 'Professor/Teacher',
        teacherName: 'Mr. Ram Prasad Yadav',
        time: '8:00 - 10:00 AM',
      ),
      RoutineDetails(
        title: 'Pully Chain',
        classType: 'Practitcal Class',
        image: 'images/subjects.jpg',
        subject: 'Subject',
        subjectType: 'Physics',
        teacher: 'Professor/Teacher',
        teacherName: 'Mr. Hari Prasad Acharya',
        time: '11:00 - 1:00 PM',
      ),
      RoutineDetails(
        title: 'Co-ordinate \nGeometry',
        classType: 'Theory Class',
        image: 'images/subjects.jpg',
        subject: 'Subject',
        subjectType: 'Optional Math',
        teacher: 'Professor/Teacher',
        teacherName: 'Mrs. Laxmi Kumari Bhandari',
        time: '1:30 - 3:30 PM',
      ),
    ];
    routineList.value = rouList;
  }
}