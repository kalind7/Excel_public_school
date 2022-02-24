

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_project_work/ui_pages/calender/eventmode.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/simmer/main_shimmer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:table_calendar/table_calendar.dart';


class EnglishCalendar extends StatefulWidget{

  

  @override
  State<EnglishCalendar> createState() => _EnglishCalendarState();
}

class _EnglishCalendarState extends State<EnglishCalendar> {
  bool isLoading = false;

  List<EventModel> models = [];

  Future loadData() async {

    setState(()=> isLoading = true );

    await Future.delayed(const Duration(seconds: 2));


    models = List.of(allModel);

    setState(()=> isLoading = false );
  }



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
    loadData();
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
      body: Column(
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
            child: TableCalendar(

              shouldFillViewport: true,
              focusedDay: selectedDay,
              firstDay: DateTime(1970),
              lastDay: DateTime(2040),
              calendarFormat: format,
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
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  final text = DateFormat.E().format(day);
                  return Center(
                    child: Text(text, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  );
                },
              ),

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
                    fontWeight: FontWeight.bold, color: Colors.black87),
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: const TextStyle(color: Colors.black87),
              ),
            ),
          ),

          const SizedBox(height: 10,),

          Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                child: ListView.builder(
                    itemCount: isLoading ? 4 : models.length,
                    itemBuilder: (context, index) {
                        final event = allModel[index];
                        return buildEvents(event);
                    }),
              )),
        ],
      ),
    );
  }

  Widget buildEvents(EventModel event) {
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
                  child: const Center(child: Text(' 1\nJan',style: TextStyle(color: Colors.white,fontFamily: 'Roboto'),),)
              ),
              Text('Sunday',style: TextStyle(color: pink ,fontFamily: 'Roboto'),)
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
          event.title,
          style:  TextStyle(
              fontSize: 18,
              color: pink,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(
          event.subtitle,
          style:  TextStyle(
              fontSize: 15,
              color: pink,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500),
        ),
      ),
    ) ;
  }
}

class Event {
  final String title;

  Event({required this.title});

    @override
  String toString() => title;
}