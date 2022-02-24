import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/calender/english_calender.dart';
import 'package:new_project_work/ui_pages/calender/nepali_calender.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/simmer/english_calendar_shimmer.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: WidgetAppbar(title: 'Calender', color: pink, onPress: () {}),
        ),
        body:  DefaultTabController(
            length: 2,
            child: isLoading ?  CalendarShimmer() :
            Column(
              children: [
                ButtonsTabBar(
                    backgroundColor: orangeOne,
                    unselectedBackgroundColor: Colors.grey[300],
                    unselectedLabelStyle: const TextStyle(color: Colors.black),
                    labelStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    tabs: const [
                      Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'AD',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                  letterSpacing: 1.0,
                                  color: Colors.white),
                            ),
                          )),
                      Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'BS',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                  letterSpacing: 1.0,
                                  color: Colors.white),
                            ),
                          )),
                    ]),

                Flexible(
                    child: TabBarView(
                        children: <Widget>[

                          EnglishCalendar(),
                          NepaliCalendar(),
                        ])),
              ],
            ),



          ),
        );
  }
}

