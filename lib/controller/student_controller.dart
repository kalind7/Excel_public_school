
import 'package:get/get.dart';
import 'package:new_project_work/models/student_list.dart';

class StudentController extends GetxController{

  var studentList = <StudentDetails>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDetails();
  }


  void fetchDetails()async{
    await Future.delayed(Duration(seconds: 1));

    var newList = [
      StudentDetails(
          name: 'Kashish Chaudhary',
          Class: '4',
        roll: '25',
        email: 'std260@mail.com',
        // image: 'images/profile.png',
      ),

      StudentDetails(
        name: 'Kalind Koirala',
        Class: '4',
        roll: '26',
        email: 'std260@mail.com',
        // image: 'images/profile.png',
      ),

      StudentDetails(
        name: 'Hero Hiralal',
        Class: '4',
        roll: '27',
        email: 'std260@mail.com',
        // image: 'images/profile.png',
      ),

      StudentDetails(
        name: 'New Hero',
        Class: '4',
        roll: '28',
        email: 'std260@mail.com',
        // image: 'images/profile.png',
      ),
      StudentDetails(
        name: 'Very Hero',
        Class: '4',
        roll: '29',
        email: 'std260@mail.com',
        // image: 'images/profile.png',
      ),
      StudentDetails(
        name: 'Show Hero',
        Class: '4',
        roll: '21',
        email: 'std260@mail.com',
        // image: 'images/profile.png',
      ),
      StudentDetails(
        name: 'new hero',
        Class: '4',
        roll: '20',
        email: 'std260@mail.com',
        // image: 'images/profile.png',
      ),
    ];

    studentList.value = newList;

  }

}