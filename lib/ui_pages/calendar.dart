import 'package:excel_public_school/ui_pages/dashboard.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/foundation.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsFromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeOne,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black87,),
        ),
        // title: Text('Calendar'),

        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Row(
            children: [
              ElevatedButton(
                child: const Text(
                  'AD',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                onPressed: () {
                  if (kDebugMode) {
                    print('Pressed');
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return pinkOne;
                      } else {
                        return Colors.white;
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              ElevatedButton(
                child: const Text(
                  'BS',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                onPressed: () async {
                  NepaliDateTime? _selectedDateTime =
                  await showMaterialDatePicker(
                    context: context,
                    initialDate: NepaliDateTime.now(),
                    firstDate: NepaliDateTime(2000),
                    lastDate: NepaliDateTime(2090),
                    initialDatePickerMode: DatePickerMode.day,

                  );
                  if (kDebugMode) {
                    print(_selectedDateTime);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return pinkOne;
                      } else {
                        return Colors.white;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
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
                print(focusedDay);
              }
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            eventLoader: _getEventsFromDay,
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: pinkOne,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: const TextStyle(color: Colors.black87),
              todayDecoration: BoxDecoration(
                color: pinkOne,
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
                color: pinkOne,
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