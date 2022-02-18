import 'package:excel_public_school/widgets/grid_view.dart';
import 'package:excel_public_school/widgets/landing_page.dart';
import 'package:flutter/material.dart';


class NewDashboard extends StatelessWidget {
    NewDashboard({Key? key}) : super(key: key);
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        children: [
          LandingPage(iconTitle: 'files/icons/four_bar_menu.svg',onPress: (){_scaffoldKey.currentState!.openDrawer();},),
          Gridview(),
        ],
      ),
    );
  }
}
