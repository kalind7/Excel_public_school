import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/controller/student_controller.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/admin_bio.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/elevated_button.dart';
import 'package:new_project_work/widgets/single_drop_down_class.dart';
import 'package:new_project_work/widgets/single_drop_down_name.dart';
import 'package:new_project_work/widgets/text_field.dart';

class StudentLists extends StatefulWidget {
  const StudentLists({Key? key}) : super(key: key);

  @override
  _StudentListsState createState() => _StudentListsState();
}

class _StudentListsState extends State<StudentLists> {
  final studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: WidgetAppbar(
              title: 'Students List',
              onPress: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [SingleDropDownName(), SingleDropDownClass()],
            ),
            NewTextField(
              text: 'Search ',
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Button(
                text: 'Search',
                onPress: () {},
                shadowColor: orangeOne,
                color: orangeOne,
              ),
            ),
            Column(
              children: [
                Obx(() => studentController.loading.value
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 10.0),
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: studentController.studentList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width / 1.15,
                            margin: EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.shade100,
                                border: Border.all(
                                  color: orangeOne,
                                  width: 0.5,
                                )),
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
                                            '${studentController.studentList[index].image}'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30.0),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name: ${studentController.studentList[index].name}',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        'Class: ${studentController.studentList[index].Class}',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        'Roll No: ${studentController.studentList[index].roll}',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        'E-mail: ${studentController.studentList[index].email}',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
