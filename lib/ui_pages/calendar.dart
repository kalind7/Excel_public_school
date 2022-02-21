import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/widgets/calendar/english_calendar.dart';
import 'package:excel_public_school/widgets/calendar/nepali_calendar.dart';
import 'package:excel_public_school/widgets/category_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  @override

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        drawer: const CategoryDrawer(),
        body: SafeArea(
            child: DefaultTabController(
              length: 2,
              child: Column(children: <Widget>[
                ButtonsTabBar(
                    backgroundColor: orangeOne,
                    unselectedBackgroundColor: Colors.grey[300],
                    unselectedLabelStyle: const TextStyle(color: Colors.black),
                    labelStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    tabs: const [
                      Tab(child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.0), child: Text('AD',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Roboto',letterSpacing: 1.0,color: Colors.white),),)),
                      Tab(child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.0), child: Text('BS',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Roboto',letterSpacing: 1.0,color: Colors.white),),)),

                    ]),
                Expanded(
                    child: TabBarView(children: <Widget>[
                      const EnglishCalendar(),
                      NepaliCalendar(),
                    ]))
              ]),
            )));
  }
}

// ElevatedButton(
//                 child: const Text(
//                   'BS',
//                   style: TextStyle(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87),
//                 ),
//                 onPressed: () async {
//                   NepaliDateTime? _selectedDateTime =
//                   await showMaterialDatePicker(
//                     context: context,
//                     initialDate: NepaliDateTime.now(),
//                     firstDate: NepaliDateTime(2000),
//                     lastDate: NepaliDateTime(2090),
//                     initialDatePickerMode: DatePickerMode.day,
//
//                   );
//                   if (kDebugMode) {
//                     print(_selectedDateTime);
//                   }
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                         (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.pressed)) {
//                         return pinkOne;
//                       } else {
//                         return Colors.white;
//                       }
//                     },
//                   ),
//                 ),
//               ),
