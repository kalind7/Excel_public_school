import 'package:excel_public_school/ui_pages/homepage.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/widgets/category_drawer.dart';
import 'package:excel_public_school/widgets/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminBio extends StatelessWidget {
  AdminBio({
    Key? key,
  }) : super(key: key);

  void _showToast() {
    Fluttertoast.showToast(
      msg: 'Contact info : std260@mail.com',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color(0xffef5350),
      textColor: Colors.white,
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const CategoryDrawer(),
        body: ListView(
          children: [
            LandingPage(iconTitle: 'files/icons/four_bar_menu.svg',onPress: (){_scaffoldKey.currentState!.openDrawer();},),
            
          ],
        ),
      ),
    );
  }
}
