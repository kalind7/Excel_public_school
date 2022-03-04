import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/student_attendance_controller.dart';

class FixedColumnWidget extends StatefulWidget {
  const FixedColumnWidget({Key? key}) : super(key: key);

  @override
  _FixedColumnWidgetState createState() => _FixedColumnWidgetState();
}

class _FixedColumnWidgetState extends State<FixedColumnWidget> {

  StudentAttendanceController attendanceController = Get.put(StudentAttendanceController());

  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: DataTable(
        sortColumnIndex: _currentSortColumn,
        sortAscending: _isAscending,
        showBottomBorder: true,
        horizontalMargin: 10,
        columnSpacing: 20,
        headingRowColor: MaterialStateProperty.all(pink),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: 0.5,color: Colors.grey),
            right: BorderSide(width: 0.5,color: Colors.grey),
          ),
        ),
        columns: [
          DataColumn(
            label: Text('Name',style: mainName,),
            onSort: (columnIndex, _){
              setState(() {
                _currentSortColumn = columnIndex;
                if(_isAscending == true){
                  _isAscending = false;
                  // attendanceController.studentAttendanceList.sort((a , b) => b[].compareTo (a[]) );
                }
              });
            }
          ),
        ],
        rows: [
          ...attendanceController.studentAttendanceList
              .map((attendance) => DataRow(
            cells: [
              DataCell(Text(
                '${attendance.roll.toString()}   ${attendance.stdName} ',
                style: headerName,
              )),

            ],
          )).toList(),
        ],
      ),
    ),);
  }
}
