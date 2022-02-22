import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/calender/english_calender.dart';
import 'package:new_project_work/ui_pages/calender/nepali_calender.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';

class Calendar extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: WidgetAppbar(title: 'Calender', color: pink, onPress: () {}),
        ),
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
                  child: TabBarView(children: <Widget>[
                EnglishCalendar(),
                NepaliCalendar(),
              ])),
            ]),
          ),
        ));
  }
}
