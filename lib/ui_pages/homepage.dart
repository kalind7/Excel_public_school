import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:excel_public_school/ui_pages/admin_bio.dart';
import 'package:excel_public_school/ui_pages/calendar.dart';
import 'package:excel_public_school/ui_pages/newDashboard.dart';
import 'package:excel_public_school/ui_pages/notice.dart';
import 'package:excel_public_school/ui_pages/settings.dart';
import 'package:excel_public_school/ui_pages/student_details.dart';
import 'package:excel_public_school/ui_pages/homework.dart';
import 'package:excel_public_school/widgets/logout_popup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';




// ignore: non_constant_identifier_names
void SelectedItem(BuildContext context, item) {
  switch (item) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Settings()));
      break;
    case 1:
      if (kDebugMode) {
        print("Privacy Clicked");
      }
      break;
    case 2:
      if (kDebugMode) {
        print("User Logged out");
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const BuildPopupDialog();
          });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;
  final screens = <Widget>[
    AdminBio(),
    const Calendar(),
    const Notice(),
    const Settings(),
  ];


  @override
  Widget build(BuildContext context) {
    return CurvedNavBar(

      actionButton: CurvedActionBar(
          onTab: (value) {
            print(value);
          },
          activeIcon: Container(
            padding: const EdgeInsets.all(8),
            decoration:
            const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            child: const Icon(
              Icons.home,
              size: 50,
              color: Colors.orange,
            ),
          ),
          inActiveIcon: Container(
            padding: const EdgeInsets.all(8),
            decoration:
            const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            child: const Icon(
              Icons.home_filled,
              size: 50,
              color: Colors.orange,
            ),
          ),
          text: "Home"),
      activeColor: Colors.blue,
      navBarBackgroundColor: Colors.grey,
      inActiveColor: Colors.black45,
      appBarItems: [
        FABBottomAppBarItem(
            activeIcon: const Icon(
              Icons.person,
              color: Colors.blue,
            ),
            inActiveIcon: const Icon(
              Icons.person_outline_outlined,
              color: Colors.black26,
            ),
            text: 'Profile'),
        FABBottomAppBarItem(
            activeIcon: const Icon(
              Icons.calendar_today,
              color: Colors.blue,
            ),
            inActiveIcon: const Icon(
              Icons.calendar_today_outlined,
              color: Colors.black26,
            ),
            text: 'Calendar'),
        FABBottomAppBarItem(
            activeIcon: const Icon(
              Icons.home_work,
              color: Colors.blue,
            ),
            inActiveIcon: const Icon(
              Icons.home_work_outlined,
              color: Colors.black26,
            ),
            text: 'Homework'),
        FABBottomAppBarItem(
            activeIcon: const Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            inActiveIcon: const Icon(
              Icons.settings_accessibility_rounded,
              color: Colors.black26,
            ),
            text: 'Settings'),


      ],
      bodyItems: [
        const StudentDetails(),
        const Calendar(),
        Homework(),
        const Settings(),
      ],
      actionBarView: NewDashboard(),
    );
  }
}


