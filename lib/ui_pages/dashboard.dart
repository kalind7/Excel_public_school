import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/events.dart';
import 'package:new_project_work/ui_pages/fees.dart';
import 'package:new_project_work/ui_pages/function_dashboard.dart';
import 'package:new_project_work/ui_pages/list_of_students.dart';
import 'package:new_project_work/ui_pages/settings.dart';
import 'package:new_project_work/widgets/admin_bio.dart';
import 'package:new_project_work/widgets/build_menu_item.dart';
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () =>  _scaffoldKey.currentState!.openDrawer(),
          icon: Icon(Icons.menu, color: Colors.black),
        ),
        title: Text('Dashboard',style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),),
        centerTitle: true,
        backgroundColor: Colors.green.shade200,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 3.0, top: 2.0),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => BuildPopupDialog(),
                );
              },
              icon: Icon(Icons.logout,
                  color: Colors.black, size: 25.0),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 3.0,
        child:  Container(
          color: Colors.grey.shade100,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                accountName: Text('Kalind Koirala',style: TextStyle(fontSize: 16.0, fontFamily: 'OpenSans',color: Colors.black),),
                accountEmail: Text('kalindkoirala7@gmail.com',style: TextStyle(fontSize: 16.0, fontFamily: 'OpenSans',color: Colors.black),),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/profile.png'),
                ),
              ),

              buildMenuItem(
                text: 'Profile',
                icon: Icons.person,
                onpress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminBio(
                            text: 'Kalind Koirala',
                            bio: 'My name is Kalind and I am a freelance mobile app developer\n If you need any mobile app for your company then contact me for more informations. ',
                            jobtitle: 'Job',
                            answer1: 'Developer',
                            length: 'Time',
                            answer2: '1+ Year',
                            question: 'Teacher ?',
                            answer3: 'YES',
                          )));
                },
              ),
              buildMenuItem(
                text: 'Fees',
                icon: Icons.event_note_rounded,
                onpress: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Fees()));
                },
              ),
              buildMenuItem(
                text: 'Result',
                icon: Icons.file_copy_sharp,
                onpress: () {
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Attendance',
                icon: Icons.home_work_outlined,
                onpress: () {
                  Get.toNamed('/attendance');
                },
              ),
              buildMenuItem(
                text: 'Subjects',
                icon: Icons.subject,
                onpress: () {
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Downloads',
                icon: Icons.download_rounded,
                onpress: () {
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Routine',
                icon: Icons.request_page_outlined,
                onpress: () {
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Library',
                icon: Icons.library_books_sharp,
                onpress: () {
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Teachers',
                icon: Icons.people,
                onpress: () {
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Exam',
                icon: Icons.wallpaper,
                onpress: () {
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Dormitory',
                icon: Icons.hotel,
                onpress: () {
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Transport',
                icon: Icons.bus_alert,
                onpress: () {
                  Get.toNamed('/login');
                },
              ),
              Divider(
                color: Colors.black87,
                thickness: 1,
              ),
              buildMenuItem(
                text: 'Logout',
                icon: Icons.logout,
                onpress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        BuildPopupDialog(),
                  );
                },
              ),

              buildMenuItem(
                text: 'Settings',
                icon: Icons.settings,
                onpress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                },
              ),
            ],
          ),
        ),

      ),
      body:  Stack(
          children: <Widget>[
            SafeArea(
              child: Column(
                children: <Widget>[

                  NewTextField(
                    text: 'Search for requirements.',
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: GridView.count(

                      crossAxisCount: 2,
                      children: List.generate(dashModels.length, (index) {
                        return Card(
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
                              Text(dashModels[index].title),
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

    );
  }
}

class Dashmodels {
  final String image;
  final String title;
  final Function onPress;

  Dashmodels({required this.image, required this.title, required this.onPress});
}

