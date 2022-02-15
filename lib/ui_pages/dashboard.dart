import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/events.dart';
import 'package:new_project_work/ui_pages/fees.dart';
import 'package:new_project_work/ui_pages/function_dashboard.dart';
import 'package:new_project_work/ui_pages/list_of_students.dart';
import 'package:new_project_work/ui_pages/settings.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/admin_bio.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/build_menu_item.dart';
import 'package:new_project_work/widgets/category_drawer.dart';
import 'package:new_project_work/widgets/logout_popup.dart';
import 'package:new_project_work/widgets/text_field.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Dashmodels> dashModels = [
      Dashmodels(
        image: 'images/allStudents.jpg',
        title: 'All Students',
        onPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StudentLists()));
        },
      ),
      Dashmodels(
        image: 'images/functionDashboard.png',
        title: 'Function Dashboard',
        onPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GradStudent()));
        },
      ),
      Dashmodels(
        image: 'images/eventsss.jpg',
        title: 'Upcoming Events',
        onPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Events()));
        },
      ),
      Dashmodels(
        image: 'images/examD.png',
        title: 'Exam Results',
        onPress: () {},
      ),
      Dashmodels(
        image: 'images/teacherRecord.png',
        title: 'Teachers Record',
        onPress: () {},
      ),
      Dashmodels(
        image: 'images/logout.jpg',
        title: 'Logout',
        onPress: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => BuildPopupDialog(),
          );
        },
      ),
    ];


    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(55.0),
          child: WidgetAppbar(
              title: 'Dashboard',
              onPress: () => _scaffoldKey.currentState!.openDrawer(),
              icon: Icons.menu,
          ),
        ),
        drawer: CategoryDrawer(),
        body:  Stack(
          children: <Widget>[
            SafeArea(
              child: Column(
                children: <Widget>[

                  SizedBox(height: 10.0),
                  NewTextField(
                    text: 'Search for requirements.',
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(dashModels.length, (index) {
                        return Card(
                          // borderOnForeground: true,
                          color: Colors.grey.shade50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  dashModels[index].onPress();
                                },
                                child: Image(
                                  height: 120,
                                  image: AssetImage(dashModels[index].image),
                                ),
                              ),
                              Text(dashModels[index].title, style: TextStyle(fontFamily: 'OpenSans', color: redTwo, fontWeight: FontWeight.w600),),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dashmodels {
  final String image;
  final String title;
  final Function onPress;

  Dashmodels({required this.image, required this.title, required this.onPress});
}

