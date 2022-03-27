import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/controller/event/table_event_controller.dart';

import 'package:new_project_work/ui_pages/calender/english_calender.dart';
import 'package:new_project_work/ui_pages/calender/nepali_calender.dart';
import 'package:new_project_work/ui_pages/student/drawer/student_drawer.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/simmer/main_shimmer.dart';

class Calendar extends StatefulWidget {
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //  final tableEventController = Get.find(());
  final tableEventController = Get.put(TableEventController());

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: WidgetAppbar(
              title: 'Calender',
              color: pink,
              icon: Icons.menu,
              onPress: () {
            _scaffoldKey.currentState!.openDrawer();
          }),
        ),
        drawerEnableOpenDragGesture: true,
        drawer: StudentDrawer(),
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Column(
                children: <Widget>[
              Obx(
                () => tableEventController.isloading.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShimmerWidget.rectangular(
                            height: 40,
                            width: 70,
                            shapeBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          ShimmerWidget.rectangular(
                            height: 40,
                            width: 70,
                            shapeBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ],
                      )
                    : ButtonsTabBar(
                        backgroundColor: orangeOne,
                        unselectedBackgroundColor: Colors.grey[300],

                        tabs: const [
                            Tab(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                'AD',
                                style: tabTitle,
                              ),
                            )),
                            Tab(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                'BS',
                                style: tabTitle,
                              ),
                            )),
                          ]),
              ),
              Flexible(
                  child: TabBarView(
                      children: <Widget>[
                EnglishCalendar(),
                CalendarDatePickerWidget(),
                // NepaliCalendar(),
              ])),
            ]),
          ),
        ));
  }
}
