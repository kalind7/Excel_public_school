import 'dart:developer';

import 'package:flutter/material.dart' hide CalendarDatePicker;
import 'package:get/get.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:new_project_work/ui_pages/student/attendance/controller/student_attendeence_controllert.dart';
import 'package:new_project_work/ui_pages/student/attendance/model/student_attendence_model.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/constant.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/simmer/calender_day_shimmer.dart';

class StudentAttendanceView extends StatefulWidget {
  @override
  State<StudentAttendanceView> createState() => _StudentAttendanceViewState();
}

class _StudentAttendanceViewState extends State<StudentAttendanceView> {
  final studentAttendanceViewController =
      Get.put(StudentAttendenceViewController());

  Attendance? selectedAttendence = null;

  @override
  Widget build(BuildContext context) {
    // return Obx(
    //   () => studentAttendanceViewController.isloading.value
    //       ? CalendarShimmer()
    //       :
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Attendacne'),
      ),
      body: Obx(
        () => Column(
          children: [
            CalendarDatePicker(
              onDisplayedMonthChanged: (date) {
                studentAttendanceViewController.attendencelist.clear();
                studentAttendanceViewController.getstudentattencelist(
                    date.year, date.month);
                setState(() {
                  selectedAttendence = null;
                });
              },
              initialDate: NepaliDateTime.now(),
              firstDate: NepaliDateTime(
                NepaliDateTime.now().year - 1,
                NepaliDateTime.now().month,
                NepaliDateTime.now().day,
              ),
              lastDate: NepaliDateTime.now(),
              // onDateChanged: (date) {},
              dayBuilder: (dayToBuild) {
                // var attendences =
                //     studentAttendanceViewController.attendencelist;
                // log(attendences.toString());

                for (Attendance i
                    in studentAttendanceViewController.attendencelist) {
                  if (i.attendanceDate.isSameDate(dayToBuild)) {
                    selectedAttendence = i;
                  }
                }
                // final currentAttendance = studentAttendanceViewController
                //     .attendencelist
                //     .where((element) =>
                //         element.attendanceDate.year == dayToBuild.year &&
                //         element.attendanceDate.month ==
                //             dayToBuild.month &&
                //         element.attendanceDate.day == dayToBuild.day)
                //     .toList();

                // element.attendanceDate.isSameDate(
                //   DateTime(
                //     dayToBuild.year,
                //     dayToBuild.month,
                //     dayToBuild.day,
                //   ),
                // );

                return studentAttendanceViewController.isloading.value &&
                        selectedAttendence == null
                    ? CalenderDayShimmer()
                    : Stack(
                        children: <Widget>[
                          Center(
                            child: Text(
                              NepaliUtils().language == Language.nepali
                                  ? '${dayToBuild.day}'
                                  : NepaliUnicode.convert('${dayToBuild.day}'),
                              style: TextStyle(
                                  color: selectedAttendence == null
                                      ? Colors.amber
                                      : Colors.green
                                  // color: selectedAttendence == null
                                  //     ? Colors.amber
                                  //     : (selectedAttendence?.attendanceType ==
                                  //             "P")
                                  //         ? Colors.green
                                  //         : (selectedAttendence?.attendanceType ==
                                  //                 "A")
                                  //             ? Colors.red
                                  //             : Colors.black,
                                  ),
                            ),
                          ),
                        ],
                      );
              },
            ),
            studentAttendanceViewController.isloading.value
                ? CircularProgressIndicator()
                : Wrap(
                    children: [
                      attendancecard(
                          title: 'Present',
                          value: studentAttendanceViewController
                              .detaillist.value.p),
                      attendancecard(
                          title: 'Absent',
                          value: studentAttendanceViewController
                              .detaillist.value.a),
                      attendancecard(
                          title: 'Late',
                          value: studentAttendanceViewController
                              .detaillist.value.l),
                      attendancecard(
                          title: 'Half Day',
                          value: studentAttendanceViewController
                              .detaillist.value.f),
                      attendancecard(
                          title: 'Holiday',
                          value: studentAttendanceViewController
                              .detaillist.value.h),
                    ],
                  )
            // detaillist
          ],
          // ),
        ),
      ),
    );
  }
}

attendancecard({required String title, required var value}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      height: 70,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: titleStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(value.toString(), style: subTitle),
              ]),
        ),
      ),
    ),
  );
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
