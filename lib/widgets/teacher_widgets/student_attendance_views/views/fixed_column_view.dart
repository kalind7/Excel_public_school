import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/teacher_widgets/student_attendance_views/controller/student_attendance_controller.dart';

class FixedColumnNameWidget extends StatefulWidget {
  const FixedColumnNameWidget({Key? key}) : super(key: key);

  @override
  _FixedColumnNameWidgetState createState() => _FixedColumnNameWidgetState();
}

class _FixedColumnNameWidgetState extends State<FixedColumnNameWidget> {

  StudentAttendanceController attendanceController = Get.put(StudentAttendanceController());

  int ? sortColumnIndex;
  bool isAscending = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: DataTable(
        sortAscending: isAscending,
        sortColumnIndex: sortColumnIndex,
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
            onSort: onSort,
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

  void onSort(int columnIndex, bool ascending){
    setState(() {

      if(columnIndex ==0){
        attendanceController.studentAttendanceList.sort((user1, user2) =>
            compareString(ascending, user1.stdName, user2.stdName));
      }
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }
  int compareString(bool ascending, String value1, String value2) =>
     ascending ? value1.compareTo(value2) : value2.compareTo(value1);

}
