import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_project_work/controller/student_controller.dart';
import 'package:new_project_work/widgets/admin_bio.dart';

class TeacherLists extends StatefulWidget {
  const TeacherLists({Key? key}) : super(key: key);

  @override
  _TeacherListsState createState() => _TeacherListsState();
}

class _TeacherListsState extends State<TeacherLists> {
  final teacherController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher List'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              GetX<StudentController>(builder: (controller) {
                return ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.teacherList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: HexColor("#F4F4F4"),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AdminBio(
                                            text: 'New Teacher',
                                            bio:
                                                'I am teacher of class 4 and am teaching hardly to complete my primary courses.',
                                            jobtitle: 'Job',
                                            answer1: 'Teacher',
                                            length: 'Class',
                                            answer2: '4',
                                            question: 'Teacher ?',
                                            answer3: 'Yes',
                                          ),
                                        ));
                                  },
                                  child: Image(
                                    height: 100,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        '${controller.teacherList[index].image}'),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name: ${controller.teacherList[index].name}',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'Degree: ${controller.teacherList[index].degree}',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'Experience: ${controller.teacherList[index].experience}',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'E-mail: ${controller.teacherList[index].email}',
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
