// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/event_model.dart';
import 'package:new_project_work/table_event_controller.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils.dart';

class TableEventsExample extends StatefulWidget {
  const TableEventsExample({Key? key}) : super(key: key);

  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {

  int month = kToday.month;
  final tableEventController = Get.put(TableEventController());
  // final kFirstCurrentDay = DateTime(kToday.year, month, 1);
  // final kLastCurrentDay = DateTime(kToday.year, month, kToday.day);
  var toogled = false;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    tableEventController.selectedEvents = tableEventController.getEventsForDay(_selectedDay!);
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

        tableEventController.selectedEvents = tableEventController.getEventsForDay(selectedDay);
      });

      print(tableEventController.selectedEvents);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      print(tableEventController.selectedEvents);
      toogled = true;
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      tableEventController.selectedEvents = tableEventController.getEventsForRange(start, end);
    } else if (start != null) {
      tableEventController.selectedEvents = tableEventController.getEventsForDay(start);
    } else if (end != null) {
      tableEventController.selectedEvents = tableEventController.getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Events'),
      ),
      body:

              Column(
                children: [

                  TableCalendar(
                    firstDay: toogled ? DateTime(kToday.year, month, 1) : kFirstDay,
                    lastDay: toogled ? DateTime(kToday.year, month + 1, 0) : kLastDay,
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    rangeStartDay: _rangeStart,
                    rangeEndDay: _rangeEnd,
                    calendarFormat: _calendarFormat,
                    rangeSelectionMode: _rangeSelectionMode,
                    eventLoader: tableEventController.getEventsForDay,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                      // Use `CalendarStyle` to customize the UI
                      outsideDaysVisible: false,
                    ),
                    headerVisible: true,
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
                      month = focusedDay.month;
                      tableEventController.getEvent();
                      print(month);
                      print('changes pages');
                      _focusedDay = focusedDay;
                    },

                  ),const SizedBox(height: 8.0),

        Container(
          height:100,child:
                       ListView.builder(
                          itemCount: tableEventController.selectedEvents.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ListTile(
                                onTap: () => {},
                                title: Text(tableEventController.selectedEvents[index].eventTitle),
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
