import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:excel_public_school/ui_pages/admin_bio.dart';
import 'package:excel_public_school/ui_pages/calendar.dart';
import 'package:excel_public_school/ui_pages/newDashboard.dart';
import 'package:excel_public_school/ui_pages/notice.dart';
import 'package:excel_public_school/ui_pages/settings.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/widgets/bottom_nav_bar.dart';

import 'package:excel_public_school/widgets/logout_popup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



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

class _HomePageState extends State<HomePage>  {

  final bool _showNotch = true;
  final FloatingActionButtonLocation
  _fabLocation = FloatingActionButtonLocation.centerDocked;
   int index  = 0;
  final screens = <Widget> [
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
            /// perform action here
            print(value);
          },
          activeIcon: Container(
            padding: EdgeInsets.all(8),
            decoration:
            BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            child: Icon(
              Icons.home,
              size: 50,
              color: Colors.orange,
            ),
          ),
          inActiveIcon: Container(
            padding: EdgeInsets.all(8),
            decoration:
            BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            child: Icon(
              Icons.home_filled,
              size: 50,
              color: Colors.orange,
            ),
          ),
          text: "Camera"),
      activeColor: Colors.blue,
      navBarBackgroundColor: Colors.grey,
      inActiveColor: Colors.black45,
      appBarItems: [
        FABBottomAppBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            inActiveIcon: Icon(
              Icons.home,
              color: Colors.black26,
            ),
            text: 'Home'),
        FABBottomAppBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            inActiveIcon: Icon(
              Icons.home,
              color: Colors.black26,
            ),
            text: 'Home'),
        FABBottomAppBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            inActiveIcon: Icon(
              Icons.home,
              color: Colors.black26,
            ),
            text: 'Home'),
        FABBottomAppBarItem(
            activeIcon: Icon(
              Icons.wallet_giftcard,
              color: Colors.blue,
            ),
            inActiveIcon: Icon(
              Icons.wallet_giftcard,
              color: Colors.black26,
            ),
            text: 'Wallet'),
      ],
      bodyItems: [
        const Calendar(),
        const Calendar(),
        const Calendar(),

        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.pinkAccent,
        )
      ],
      actionBarView: Container(

        height: MediaQuery.of(context).size.height,
        color: Colors.red,
      ),
    );
  }

  void onChangedTab(int index){
    setState(() {
      this.index = index;
    });
  }
}


