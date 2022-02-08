import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_project_work/controller/student_controller.dart';
import 'package:new_project_work/widgets/admin_bio.dart';
import 'package:new_project_work/widgets/drop_down.dart';


class StudentLists extends StatefulWidget {
  const StudentLists({Key? key}) : super(key: key);

  @override
  _StudentListsState createState() => _StudentListsState();
}

class _StudentListsState extends State<StudentLists> {
  final studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students List'),
        centerTitle: true,
      ),
      body: ListView(
        children: [

          SizedBox(height: 10.0,),

          DropDown(),

          SizedBox(height: 10.0,),

          Column(
            children: [
              GetX<StudentController>(builder: (controller) {
                return ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.studentList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        margin: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          border: Border.all(
                            color: HexColor('#F4F4F4'),
                            width: 2.0,
                          )
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 15.0),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AdminBio(
                                            text: 'Kashish Chaudhary',
                                            bio:
                                                'I am student of class 4 and am studying hardly to complete my primary classes.',
                                            jobtitle: 'Job',
                                            answer1: 'Student',
                                            length: 'Class',
                                            answer2: '4',
                                            question: 'Teacher ?',
                                            answer3: 'NO',
                                          ),
                                        ));
                                  },
                                  child: Image(
                                    height: 75,
                                    width: 75,
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        '${controller.studentList[index].image}'),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 30.0),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name: ${controller.studentList[index].name}',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'Class: ${controller.studentList[index].Class}',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'Roll No: ${controller.studentList[index].roll}',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'E-mail: ${controller.studentList[index].email}',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }),
            ],
          ),
        ],
      ),
    );
  }
}
