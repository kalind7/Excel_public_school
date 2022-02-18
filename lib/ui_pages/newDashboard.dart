import 'package:excel_public_school/widgets/bottom_nav_bar.dart';
import 'package:excel_public_school/widgets/category_drawer.dart';
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
      drawer: CategoryDrawer(),

      body: ListView(
        children: [
          LandingPage(iconTitle: 'files/icons/four_bar_menu.svg',onPress: (){_scaffoldKey.currentState!.openDrawer();},),

          const Gridview(),

        ],
      ),
    );
  }
}
