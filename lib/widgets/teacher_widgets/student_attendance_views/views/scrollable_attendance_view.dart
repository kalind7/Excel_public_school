import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/widgets/teacher_widgets/button.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/teacher_attendance_controller.dart';

class ScrollableAttendanceView extends StatefulWidget {
  const ScrollableAttendanceView({Key? key}) : super(key: key);

  @override
  _ScrollableAttendanceViewState createState() => _ScrollableAttendanceViewState();
}

class _ScrollableAttendanceViewState extends State<ScrollableAttendanceView> {
  TeacherAttendanceController attendanceController = Get.put(TeacherAttendanceController());

  var data = Map<String , String>();

  var note = Map<String, dynamic>();

  List <int> idList = [];

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
                      label: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: GestureDetector(
                          onTap: (){
                            print('tapped');
                          },
                          child: Text('P',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green.shade300,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto')),
                        ),
                      ),
                    ),
                    DataColumn(
                        label: Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('A',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red.shade300,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto')))),
                    DataColumn(
                        label: Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('H',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange.shade300,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto')))),
                  ],
                  rows: [
                    ...attendanceController.teacherAttendanceList
                        .map((attendance) =>
                        DataRow(
                          cells: [
                            DataCell(
                              Container(
                                alignment: AlignmentDirectional.center,
                                child: Radio(
                                    value: 0,
                                    groupValue: attendance.id,
                                    onChanged: (newValue){
                                      setState(() {
                                        // data[attendance.id.toString()] = value.toString();

                                        if (note.containsKey(attendance.id.toString() )){
                                          note.update(attendance.id.toString(), (value) => 'P');
                                        }else{
                                          note[attendance.id.toString()] = null;
                                        }


                                        idList.contains(attendance.id) ? null : idList.add(attendance.id);
                                        print(idList);

                                        if (data.containsKey(attendance.id.toString() )){
                                          data.update(attendance.id.toString(), (value) => 'P');
                                        }else{
                                          data[attendance.id.toString()] = 'P';
                                        }
                                        print(data);
                                        attendance.id = newValue as int;
                                      });
                                    }
                                ),
                              ),
                            ),
                            DataCell(Container(
                              alignment: AlignmentDirectional.center,
                              child: Radio(
                                  value: 1,
                                  groupValue: attendance.id,
                                  onChanged: (newValue){
                                    setState(() {

                                      if (note.containsKey(attendance.id.toString() )){
                                        note.update(attendance.id.toString(), (value) => null);
                                      }else{
                                        note[attendance.id.toString()] = null;
                                      }

                                      idList.contains(attendance.id) ? null : idList.add(attendance.id);
                                      print(idList);

                                      if (data.containsKey(attendance.id.toString() )){
                                        data.update(attendance.id.toString(), (value) => 'A');
                                      }else{
                                        data[attendance.id.toString()] = 'A';
                                      }
                                      print(data);
                                      attendance.id = newValue as int;
                                    });
                                  }
                              ),
                            )),
                            DataCell(Container(
                              alignment: AlignmentDirectional.center,
                              child: Radio(
                                  value: 2,
                                  groupValue: attendance.id,
                                  onChanged: (newValue){
                                    setState(() {

                                      if (note.containsKey(attendance.id.toString() )){
                                        note.update(attendance.id.toString(), (value) => null);
                                      }else{
                                        note[attendance.id.toString()] = null;
                                      }

                                      idList.contains(attendance.id) ? null : idList.add(attendance.id);
                                      print(idList);
                                      if (data.containsKey(attendance.id.toString() )){
                                        data.update(attendance.id.toString(), (value) => 'H');
                                      }else{
                                        data[attendance.id.toString()] = 'H';
                                      }
                                      print(data);
                                      attendance.id = newValue as int;
                                    });
                                  }
                              ),
                            )),
                          ],
                        )).toList(),
                  ]),

              Center(
                child:
                button(
                    title: 'Save',
                    onPress: () {
                      var datas = {
                        "id": idList,
                        "date":"2078-11-20",
                        "note": note,
                        "attendance": data
                      };
                      print(datas);
                      attendanceController.submitTeacherAttendance(datas);
                    },
                    width: 120
                ),
              ),
            ],
          ),
        ),
      ),);
  }
}
