
import 'package:clean_nepali_calendar/clean_nepali_calendar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';
// ignore: import_of_legacy_library_into_null_safe

class NepaliCalendar extends StatelessWidget {
  NepaliCalendar({Key? key}) : super(key: key);

  final NepaliCalendarController _nepaliCalendarController = NepaliCalendarController();


  @override
  Widget build(BuildContext context) {
    NepaliDateTime first = NepaliDateTime(1998, 1);
    NepaliDateTime last = NepaliDateTime(2080, 12);
    return Scaffold(
      body: Column(

        children: [

      Container(
        margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 10),
        height: MediaQuery.of(context).size.height * 0.45 ,
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
            ]
        ),
        child: CleanNepaliCalendar(
            controller: _nepaliCalendarController,
            initialDate: NepaliDateTime.now(),
            firstDate: first,
            lastDate: last,
            language: Language.nepali,
            headerDayBuilder: (_, index) {
              return Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text('$_',
                    style: TextStyle(color: (index == 6) ? Colors.red : null),),

                ),
              );
            },

            headerDayType: HeaderDayType.halfName,

            onHeaderLongPressed: (date) {
              if (kDebugMode) {
                print('header long pressed $date');
              }
            },
            onHeaderTapped: (date) {
              if (kDebugMode) {
                print('header pressed $date');
              }
            },
            calendarStyle: const CalendarStyle(
              highlightSelected: true,
              selectedColor: Colors.blue,
              dayStyle: TextStyle(
                  fontFamily: 'Roboto', fontWeight: FontWeight.w600),
              todayStyle: TextStyle(fontSize: 20.0),
              todayColor: Colors.lightBlue,
              renderDaysOfWeek: true,
              highlightToday: true,
            ),
            headerStyle:  HeaderStyle(

              decoration: BoxDecoration(
                color: pink,
                borderRadius: BorderRadius.circular(5.0),
              ),
              titleTextStyle: TextStyle(fontSize: 16),
              leftChevronPadding: EdgeInsets.all(10),
              rightChevronPadding: EdgeInsets.all(10),
              leftChevronIcon: Icon(Icons.chevron_left_outlined),
              rightChevronIcon: Icon(Icons.chevron_right_outlined),
              enableFadeTransition: false,
              centerHeaderTitle: true,
            ),
            onDaySelected: (day) {
              if (kDebugMode) {
                print(day.toString());
              }
            },
            // dateCellBuilder: cellBuilder,
          ),
      ),
        ],
      ),
    );
  }
}

//    Widget cellBuilder(isToday, isSelected, isDisabled, nepaliDate, label, text,
//        calendarStyle, isWeekend) {
//      // print(isSelected);
//      Decoration _buildCellDecoration() {
//        if (isSelected && isToday) {
//          return BoxDecoration(
//            // shape: BoxShape.circle,
//              borderRadius: BorderRadius.circular(5),
//              color: Colors.blue,
//              border: Border.all(color: calendarStyle.selectedColor));
//        }
//        if (isSelected) {
//          return BoxDecoration(
//              borderRadius: BorderRadius.circular(5),
//              border: Border.all(color: calendarStyle.selectedColor));
//        } else if (isToday && calendarStyle.highlightToday) {
//          return BoxDecoration(
//            borderRadius: BorderRadius.circular(5),
//            border: Border.all(color: Colors.transparent),
//            color: Colors.blue,
//          );
//        } else {
//          return BoxDecoration(
//            // shape: BoxShape.circle,
//            borderRadius: BorderRadius.circular(5),
//            border: Border.all(color: Colors.transparent),
//          );
//        }
//      }
//
//      return AnimatedContainer(
//        padding: const EdgeInsets.all(3),
//        duration: const Duration(milliseconds: 2000),
//        decoration: _buildCellDecoration(),
//        child: Center(
//          child: Column(
//            children: [
//              Text(text,
//                  style: TextStyle(
//                      fontSize: 12, color: isWeekend ? Colors.red : null)),
//
//              // to show events
//              const Align(
//                  alignment: Alignment.bottomCenter,
//                  child: CircleAvatar(
//                    radius: 1,
//                  )),
//              Align(
//                alignment: Alignment.bottomRight,
//                child: Text(nepaliDate.toDateTime().day.toString(),
//                    style: TextStyle(
//                        fontSize: 8, color: isWeekend ? Colors.red : null)),
//              ),
//            ],
//          ),
//        ),
//      );
//    }
// }