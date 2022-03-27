import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_attendance_controller.dart';
import 'package:new_project_work/ui_pages/teachers/controller/teacher_attendance_report_controller.dart';

class ScrollableAttendanceReport extends StatefulWidget {
  const ScrollableAttendanceReport({Key? key}) : super(key: key);

  @override
  _ScrollableAttendanceReportState createState() => _ScrollableAttendanceReportState();
}

class _ScrollableAttendanceReportState extends State<ScrollableAttendanceReport> {
  TeacherAttendanceController attendanceController = Get.find();

  // var data = Map<String , String>();
  //
  // var note = Map<String, dynamic>();
  //
  // List <int> idList = [];

  int selectedValue = 0 ;
  bool value = true;



  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>  Flexible(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              DataTable(
                  border: TableBorder(
                      right: BorderSide(width: 0.5, color: Colors.grey)),
                  showCheckboxColumn: false,
                  showBottomBorder: true,
                  headingRowColor: MaterialStateProperty.all(Colors.green[100]),
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
                      label: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 15,right : 25),
                        decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 0.5,color: Colors.black54),
                            )
                        ),
                        child: Text('P',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.green.shade300,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto')),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 15,right: 25),
                        decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 0.5,color: Colors.black54),
                            )
                        ),
                        child: Text('A',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.red.shade300,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto')),
                      ),),
                    DataColumn(
                      label: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 15,right: 25),
                        decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 0.5,color: Colors.black54),
                            )
                        ),
                        child: Text('L',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.pink.shade200,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto')),
                      ),),
                    DataColumn(
                      label: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 15,right: 25),
                        decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 0.5,color: Colors.black54),
                            )
                        ),
                        child: Text('H',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange.shade300,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto')),
                      ),),
                    DataColumn(
                      label: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 15),
                        child: Text('%',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto')),
                      ),),
                  ],
                  rows: [
                    ...attendanceController.teacherAttendanceList
                        .map((attendance) =>
                        DataRow(
                          cells: [
                            DataCell(
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(width: 0.5,color: Colors.black54),
                                    )
                                ),
                                child: Text('22',style:TextStyle(
                                    fontSize: 16,
                                    color: Colors.green.shade300,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto') ,)
                              ),
                            ),
                            DataCell(
                              Container(
                                  alignment: Alignment.center,

                                  padding: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(width: 0.5,color: Colors.black54),
                                      )
                                  ),
                                  child: Text('4',style:TextStyle(
                                      fontSize: 16,
                                      color: Colors.red.shade300,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto') ,)
                              ),
                            ),

                            DataCell(
                              Container(
                                  alignment: Alignment.center,

                                  padding: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(width: 0.5,color: Colors.black54),
                                      )
                                  ),
                                  child: Text('5',style:TextStyle(
                                      fontSize: 16,
                                      color: Colors.pink.shade200,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto') ,)
                              ),
                            ),

                            DataCell(
                              Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(width: 0.5,color: Colors.black54),
                                      )
                                  ),
                                  child: Text('7',style:TextStyle(
                                      fontSize: 16,
                                      color: Colors.orange.shade300,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto') ,)
                              ),
                            ),

                            DataCell(
                              Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text('78%',style:TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto') ,)
                              ),
                            ),
                            // DataCell(Container(
                            //   alignment: AlignmentDirectional.center,
                            //   child: Radio(
                            //       value: 2,
                            //       groupValue: attendance.id,
                            //       onChanged: (newValue){
                            //         setState(() {
                            //
                            //           if (attendanceController.note.containsKey(attendance.id.toString() )){
                            //             attendanceController.note.update(attendance.id.toString(), (value) => null );
                            //           }else{
                            //             attendanceController.note[attendance.id.toString()] = null;
                            //           }
                            //
                            //           attendanceController.idList.contains(attendance.id) ? null : attendanceController.idList.add(attendance.id);
                            //           print(attendanceController.idList);
                            //
                            //           if (attendanceController.data.containsKey(attendance.id.toString() )){
                            //             attendanceController.data[attendance.id.toString()] = 'H'  ;
                            //           }else{
                            //             attendanceController.data[attendance.id.toString()] = 'H';
                            //           }
                            //           print(attendanceController.data);
                            //           attendance.id = newValue as int;
                            //         });
                            //       }
                            //   ),
                            // )),
                          ],
                        )).toList(),
                  ]),

              // Center(
              //   child:
              //   button(
              //       title: 'Save',
              //       onPress: () {
              //         var datas = {
              //           "id": idList,
              //           "date":"2078-11-20",
              //           "note": note,
              //           "attendance": data
              //         };
              //         print(datas);
              //         attendanceController.submitTeacherAttendance(datas);
              //       },
              //       width: 120
              //   ),
              // ),
            ],
          ),
        ),
      ),);
  }
}
