import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepali_utils/src/nepali_date_time.dart';
import 'package:new_project_work/controller/event/table_event_controller.dart';
import 'package:new_project_work/ui_pages/student/attendance/controller/student_attendeence_controllert.dart';
import 'package:new_project_work/ui_pages/student/attendance/model/student_attendence_model.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/constant.dart';
import 'package:new_project_work/widgets/simmer/calendar_shimmer.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:get/get.dart';
import 'package:new_project_work/event_model.dart';

class EnglishAttendance extends StatefulWidget {
  @override
  State<EnglishAttendance> createState() => _EnglishAttendanceState();
}

class _EnglishAttendanceState extends State<EnglishAttendance>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Attendance? selectedAttendence;
  int month = kToday.month;
  final studentAttendanceViewController =
      Get.put(StudentAttendenceViewController());

  // final kFirstCurrentDay = DateTime(kToday.year, month, 1);
  // final kLastCurrentDay = DateTime(kToday.year, month, kToday.day);

  CalendarFormat _calendarFormat = CalendarFormat.month;
// Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  // bool isloading = true;
  DateTime? _selectedDay;

  List<Attendance> _getEventsForDay(DateTime day) {
    return studentAttendanceViewController.attendencelist
        .where((element) =>
            element.attendanceDate.toDateTime().year == day.year &&
            element.attendanceDate.toDateTime().month == day.month)
        .toList();
  }

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Obx(
        () => studentAttendanceViewController.isloading.value
            ? CircularProgressIndicator()
            : Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: orangeOne,
                            spreadRadius: 0.8,
                            blurRadius: 4,
                            blurStyle: BlurStyle.inner,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: TableCalendar<Attendance>(
                      pageJumpingEnabled: true,
                      locale: 'en_US',
                      calendarBuilders: CalendarBuilders(
                        holidayBuilder: (context, day, focusedDay) {
                          return Text('ff');
                        },
                        todayBuilder: (context, day, focusedDay) {
                          // return  TextStyle(color: Colors.red);
                        },
                      ),

                      weekendDays: [DateTime.saturday],
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekendStyle: TextStyle(color: Colors.red)),
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      shouldFillViewport: true,
                      firstDay: kFirstDay,
                      lastDay: kLastDay,
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),

                      // Calendar Dates styling
                      calendarStyle: const CalendarStyle(
                        // Weekend dates color (Sat & Sun Column)
                        weekendTextStyle: TextStyle(color: Colors.red),
                      ),

                      calendarFormat: _calendarFormat,

                      // eventLoader: _getEventsForDay,
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

                      headerStyle: HeaderStyle(
                        decoration: BoxDecoration(
                          color: pink,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        headerMargin:
                            const EdgeInsets.only(bottom: 10, top: 10),
                        headerPadding: const EdgeInsets.only(bottom: 5),
                        leftChevronVisible: true,
                        rightChevronVisible: true,
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        formatButtonShowsNext: false,
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        formatButtonTextStyle:
                            const TextStyle(color: Colors.white),
                      ),

                      onPageChanged: (focusedDay) {
                        // studentAttendanceViewController.getstudentattencelist(
                        //     focusedDay.toNepaliDateTime().year,
                        //     focusedDay.toNepaliDateTime().month);
                      },
                    ),
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
      ),
    );
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
