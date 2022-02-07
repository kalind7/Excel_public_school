
import 'package:get/get.dart';
import 'package:new_project_work/models/student_list.dart';
import 'package:new_project_work/models/teacher_list.dart';

class StudentController extends GetxController{

  var studentList = <StudentDetails>[].obs;
  var teacherList = <TeacherDetails>[].obs;

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
        image: 'images/profile.png',
      ),

      StudentDetails(
        name: 'Kalind Koirala',
        Class: '4',
        roll: '26',
        email: 'std260@mail.com',
        image: 'images/excellogo.png',
      ),

      StudentDetails(
        name: 'Hero Hiralal',
        Class: '4',
        roll: '27',
        email: 'std260@mail.com',
        image: 'images/games.jpg',
      ),

      StudentDetails(
        name: 'New Hero',
        Class: '4',
        roll: '28',
        email: 'std260@mail.com',
        image: 'images/concert.jpg',
      ),
      StudentDetails(
        name: 'Very Hero',
        Class: '4',
        roll: '29',
        email: 'std260@mail.com',
        image: 'images/marathon.jpg',
      ),
      StudentDetails(
        name: 'Show Hero',
        Class: '4',
        roll: '21',
        email: 'std260@mail.com',
        image: 'images/photo.jpg',
      ),
      StudentDetails(
        name: 'new hero',
        Class: '4',
        roll: '20',
        email: 'std260@mail.com',
        image: 'images/profile.png',
      ),
    ];

    var secondList = [
      TeacherDetails(
          name: 'Mr. Ram Prasad Yadav',
          degree: 'Mathematics ',
          email: 'ramprasad@gmail.com',
          image: 'images/profile.png',
      ),
      TeacherDetails(
        name: 'Mr. Hari Prasad Acharya',
        degree: 'Science',
        email: 'hari22@gmail.com',
        image: 'images/profile.png',
      ),
      TeacherDetails(
        name: 'Mrs. Laxmi Bhandari',
        degree: 'Social',
        email: 'iamlaxmi@gmail.com',
        image: 'images/profile.png',
      ),
      TeacherDetails(
        name: 'Mr. Kamal Khatri',
        degree: 'Computer Science',
        email: 'kk18@gmail.com',
        image: 'images/profile.png',
      ),
      TeacherDetails(
        name: 'Mr. Kalind Koirala',
        degree: 'Optional Mathematics',
        email: 'kk17@gmail.com',
        image: 'images/profile.png',
      ),
      TeacherDetails(
        name: 'Mrs. Shanta Banjade',
        degree: 'Nepali',
        email: 'sb45@gmail.com',
        image: 'images/profile.png',
      ),

    ];

    studentList.value = newList;
    teacherList.value = secondList;

  }

}