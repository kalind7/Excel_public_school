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
    return Scaffold(
      extendBody: true,
      floatingActionButton: _showNotch? FloatingActionButton(

        splashColor: pinkOne,
        backgroundColor: HexColor('#E1E5EC'),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewDashboard() ));
        },
        tooltip: 'Home',
        child: ImageIcon(const AssetImage('files/bottom_navbar_icons/home.png'),color: pinkOne,size: 40,),
      ): null,
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: TabBarMaterialWidget(
        index : index,
        onChangedTab: onChangedTab,
      ),
      body: screens[index],
    );
  }

  void onChangedTab(int index){
    setState(() {
      this.index = index;
    });
  }
}


