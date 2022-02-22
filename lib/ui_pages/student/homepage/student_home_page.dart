import 'package:flutter/material.dart';

import 'package:new_project_work/ui_pages/student/widget/profile_body_container.dart';


import 'package:new_project_work/widgets/appbar.dart';

import 'package:new_project_work/ui_pages/student/drawer/student_drawer.dart';
import 'package:new_project_work/widgets/grid_view.dart';

class StudentHomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
          title: '',
          onPress: () => _scaffoldKey.currentState!.openDrawer(),
          icon: Icons.menu,
        ),
      ),
      drawer: StudentDrawer(),
      body: ProfileBodyContainer(
          widget: Gridview(),
          text: 'Dhiraj Shrestha',
          image: 'images/excellogo.png'),
  
    );
  }
}
