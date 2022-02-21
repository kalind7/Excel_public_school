import 'package:excel_public_school/utils/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';



class EnglishCalendar extends StatefulWidget {
  const EnglishCalendar({Key? key}) : super(key: key);


  @override
  _EnglishCalendarState createState() => _EnglishCalendarState();
}

class _EnglishCalendarState extends State<EnglishCalendar> {

  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  final TextEditingController _eventController = TextEditingController();

  List<Event> _getEventsFromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1970),
            lastDay: DateTime(2040),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });

              if (kDebugMode) {
                print('focused day : $focusedDay');
              }
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            eventLoader: _getEventsFromDay,
            calendarStyle: CalendarStyle(

              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: const TextStyle(color: Colors.black87),
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
class Event {
  final String title;

  Event({required this.title});
  @override
  String toString() => title;
}

