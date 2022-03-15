import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/teacher_attendance_controller.dart';

class ScrollablePracticalExamView extends StatefulWidget {
  const ScrollablePracticalExamView({Key? key}) : super(key: key);

  @override
  _ScrollablePracticalExamViewState createState() => _ScrollablePracticalExamViewState();
}

class _ScrollablePracticalExamViewState extends State<ScrollablePracticalExamView> {
  TeacherAttendanceController attendanceController = Get.put(TeacherAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>  Flexible(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
              border: TableBorder(
                  right: BorderSide(width: 0.5, color: Colors.grey)),
              showCheckboxColumn: false,
              showBottomBorder: true,
              headingRowColor: MaterialStateProperty.all(Colors.grey.shade300),
              columnSpacing: 40,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              columns: [
                DataColumn(
                  label: Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text('Attendance',
                          style: scrollTitle),

                  ),

                ),

                DataColumn(
                    label: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('Homework',
                            style: scrollTitle))),
                DataColumn(
                    label: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('Classwork',
                            style: scrollTitle))),
                DataColumn(
                    label: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('Discipline',
                            style: scrollTitle))),
                DataColumn(
                    label: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('Unit-Test',
                            style: scrollTitle))),
                DataColumn(
                    label: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('Total',
                            style: scrollTitle))),
              ],
              rows: [
                ...attendanceController.teacherAttendanceList
                    .map((attendance) => DataRow(
                  cells: [
                    DataCell(
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5,color: Colors.black26 ),
                        ),
                        alignment: AlignmentDirectional.center,
                        child:  Text('2',style: scrollTitle,),
                        ),
                      ),

                    DataCell(
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 2.0),
                        // height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5,color: Colors.black26 ),
                        ),
                        alignment: AlignmentDirectional.center,
                        child:  Text('2',style: scrollTitle,),
                      ),
                    ),
                    DataCell(
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5,color: Colors.black26 ),
                        ),
                        alignment: AlignmentDirectional.center,
                        child:  Text('2',style: scrollTitle,),
                      ),
                    ),
                    DataCell(
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5,color: Colors.black26 ),
                        ),
                        alignment: AlignmentDirectional.center,
                        child:  Text('2',style: scrollTitle,),
                      ),
                    ),
                    DataCell(
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5,color: Colors.black26 ),
                        ),
                        alignment: AlignmentDirectional.center,
                        child:  Text('2',style: scrollTitle,),
                      ),
                    ),
                    DataCell(
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5,color: Colors.black26 ),
                        ),
                        alignment: AlignmentDirectional.center,
                        child:  Text('2',style: scrollTitle,),
                      ),
                    ),
                  ],
                ))
              ]),
        ),
      ),);
  }
}
