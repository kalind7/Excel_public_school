import 'package:flutter/material.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/models/student_names_model.dart';

class ApiView extends StatefulWidget {
  const ApiView({Key? key}) : super(key: key);

  @override
  _ApiViewState createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {

  // Future<NewStudentModel> createModel(String className, String section, DateTime dateTime)async{
  //   final String apiUrl = "https://ems.allstar.com.np" ;
  //
  //   final response =
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Services'),
      ),
      body: Container(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
