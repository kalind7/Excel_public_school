import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/constant.dart';
import 'package:new_project_work/widgets/simmer/calendar_shimmer.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:get/get.dart';
import 'package:new_project_work/event_model.dart';
import 'package:new_project_work/table_event_controller.dart';

class EnglishCalendar extends StatefulWidget {
  @override
  State<EnglishCalendar> createState() => _EnglishCalendarState();
}

class _EnglishCalendarState extends State<EnglishCalendar> {
  int month = kToday.month;

  final tableEventController = Get.put(TableEventController());
  // final kFirstCurrentDay = DateTime(kToday.year, month, 1);
  // final kLastCurrentDay = DateTime(kToday.year, month, kToday.day);
  var toogled = false;
  late List<Datum> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  // bool isloading = true;
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = _getEventsForDay(_selectedDay!);
  }

  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  List<Datum> _getEventsForDay(DateTime day) {
    return tableEventController.event
        .where((element) =>
            element.fromDate.year == day.year &&
            element.fromDate.month == day.month &&
            element.fromDate.day == day.day)
        .toList();
  }

  List<Datum> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        toogled = false;
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      toogled = true;
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => tableEventController.isloading.value
          ? CalendarShimmer()
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
                  child: TableCalendar<Datum>(
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    shouldFillViewport: true,
                    firstDay:
                        toogled ? DateTime(kToday.year, month, 1) : kFirstDay,
                    lastDay: toogled
                        ? DateTime(kToday.year, month + 1, 0)
                        : kLastDay,
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    rangeStartDay: _rangeStart,
                    rangeEndDay: _rangeEnd,
                    calendarFormat: _calendarFormat,
                    rangeSelectionMode: _rangeSelectionMode,
                    eventLoader: _getEventsForDay,
                    headerStyle: HeaderStyle(
                      decoration: BoxDecoration(
                        color: pink,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      headerMargin: const EdgeInsets.only(bottom: 10, top: 10),
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
                    onDaySelected: _onDaySelected,
                    onRangeSelected: _onRangeSelected,
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _selectedEvents.clear();
                      month = focusedDay.month;
                      _selectedDay = null;
                      tableEventController.getEvent();

                      _focusedDay = focusedDay;
                    },
                  ),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: _selectedEvents.length,
                    itemBuilder: (context, index) {
                      var myitem = _selectedEvents[index];

                      return ListTile(
                        leading: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: 40,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: pink,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          myitem.fromDate.day.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Roboto'),
                                        ),
                                        Text(
                                          DateFormat('MMM')
                                              .format(myitem.fromDate)
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ],
                                    )),
                                Text(
                                  DateFormat('EEEE')
                                      .format(myitem.fromDate)
                                      .toString(),
                                  // myitem.fromDate.weekday.toString(),
                                  style: TextStyle(
                                      color: Colors.pink, fontFamily: 'Roboto'),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                              height: 40,
                              child: VerticalDivider(
                                width: 4,
                                thickness: 4,
                                color: pink,
                              ),
                            ),
                          ],
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            myitem.eventTitle,
                            style: TextStyle(
                                fontSize: 18,
                                color: pink,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            myitem.eventDes,
                            maxLines: 2,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 15,
                                color: pink,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
