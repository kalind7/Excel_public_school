import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/controller/grid_view_controller.dart';
import 'package:new_project_work/models/gird_view_list.dart';
import 'package:new_project_work/ui_pages/fees.dart';
import 'package:new_project_work/ui_pages/library.dart';
import 'package:new_project_work/ui_pages/settings.dart';
import 'package:new_project_work/widgets/admin_bio.dart';
import 'package:new_project_work/ui_pages/calendar.dart';
import 'package:new_project_work/widgets/logout_popup.dart';
import 'package:new_project_work/widgets/notice.dart';
import 'package:new_project_work/widgets/build_menu_item.dart';
import 'package:new_project_work/widgets/text_field.dart';

class GradStudent extends StatefulWidget {
  const GradStudent({Key? key}) : super(key: key);

  @override
  _GradStudentState createState() => _GradStudentState();
}

class _GradStudentState extends State<GradStudent> {
  int _currentIndex = 0;

  final screens = [
    Functions(),
    AdminBio(
      text: 'Kashish Chaudhary',
      bio:
          'I am student of class 4 and am studying hardly to complete my primary classes.',
      jobtitle: 'Job',
      answer1: 'Student',
      length: 'Class',
      answer2: '4',
      question: 'Teacher ?',
      answer3: 'NO',
    ),
    Calendar(),
    Notice(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey.shade200,
        selectedItemColor: Colors.green.shade200,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Std-Profile',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_outlined),
            label: 'Notice',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            // backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class Functions extends StatefulWidget {
  const Functions({Key? key}) : super(key: key);

  @override
  _FunctionsState createState() => _FunctionsState();
}

class _FunctionsState extends State<Functions> {
  final gridController = Get.put(GridController());

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    List<Model> model = [
      // Model(text: 'text', icon: Icons.arrow_forward),
      Model(
        text: 'Profile',
        icon: Icons.person,
        onpress: () {
          print('anything');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminBio(
                  text: 'Kashish Chaudhary',
                  bio:
                      'I am student of class 4 and am studying hardly to complete my primary classes.',
                  jobtitle: 'Job',
                  answer1: 'Student',
                  length: 'Class',
                  answer2: '4',
                  question: 'Teacher ?',
                  answer3: 'NO',
                ),
              ));
        },
      ),

      Model(
        text: 'Fees',
        icon: Icons.monetization_on,
        onpress: () {
          print('anything');
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Fees()));
        },
      ),
      Model(
        text: 'Result',
        icon: Icons.description,
        onpress: () {
          print('anything');
        },
      ),
      Model(
        text: 'Attendance',
        icon:  Icons.home_work_outlined,
        onpress: () {
          print('anything');

        },
      ),
      Model(
        text: 'Subjects',
        icon: Icons.subject,
        onpress: () {
          print('anything');
        },
      ),
      Model(
        text: 'Downloads',
        icon: Icons.download_rounded,
        onpress: () {
          print('anything');
        },
      ),
      Model(
        text: 'Routine',
        icon: Icons.request_page_outlined,
        onpress: () {
          Get.toNamed('/routine');
        },
      ),
      Model(
        text: 'Library',
        icon: Icons.library_books,
        onpress: () {
          print('anything');
          Navigator.push(context, MaterialPageRoute(builder: (context) => Library()));
        },
      ),
      Model(
        text: 'Teachers',
        icon: Icons.people,
        onpress: () {
          print('anything');
          Get.toNamed('/teacherlist');
        },
      ),
      Model(
        text: 'Assignment',
        icon: Icons.file_copy_sharp,
        onpress: () {
          print('anything');
          Get.toNamed('/assignment');
        },
      ),
      Model(
        text: 'Dormitory',
        icon: Icons.hotel ,
        onpress: () {
          print('anything');
        },
      ),
      Model(
        text: 'Transport',
        icon: Icons.bus_alert,
        onpress: () {
          print('anything');
        },
      ),
    ];

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(

          leading: IconButton(
            onPressed: () =>  _scaffoldKey.currentState!.openDrawer(),
            icon: Icon(Icons.menu, color: Colors.black),
          ),

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
          child: Container(
            color: Colors.grey.shade200,
            child: ListView(
              children: <Widget>[

                SizedBox(height: 20.0),
                buildMenuItem(
                  text: 'Dashboard',
                  icon: Icons.dashboard,
                  onpress: () {
                    Get.toNamed('/dashboard');
                  },
                ),
                buildMenuItem(
                  text: 'Profile',
                  icon: Icons.person,
                  onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminBio(
                            text: 'Kashish Chaudhary',
                            bio:
                            'I am student of class 4 and am studying hardly to complete my primary classes.',
                            jobtitle: 'Job',
                            answer1: 'Student',
                            length: 'Class',
                            answer2: '4',
                            question: 'Teacher ?',
                            answer3: 'NO',
                          ),
                        ));
                  },
                ),
                buildMenuItem(
                  text: 'Fees',
                  icon: Icons.event_note_rounded,
                  onpress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Fees()));                },
                ),
                buildMenuItem(
                  text: 'Result',
                  icon: Icons.file_copy_sharp,
                  onpress: () {
                    // Get.toNamed('/login');
                  },
                ),
                buildMenuItem(
                  text: 'Attendance',
                  icon: Icons.home_work_outlined,
                  onpress: () {
                    // Get.toNamed('/attendance');
                  },
                ),
                buildMenuItem(
                  text: 'Subjects',
                  icon: Icons.subject,
                  onpress: () {
                    // Get.toNamed('/login');
                  },
                ),
                buildMenuItem(
                  text: 'Downloads',
                  icon: Icons.download_rounded,
                  onpress: () {
                    // Get.toNamed('/login');
                  },
                ),
                buildMenuItem(
                  text: 'Routine',
                  icon: Icons.request_page_outlined,
                  onpress: () {
                    Get.toNamed('/routine');
                  },
                ),
                buildMenuItem(
                  text: 'Library',
                  icon: Icons.library_books_sharp,
                  onpress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Library()));
                    // Get.toNamed('/login');
                  },
                ),
                buildMenuItem(
                  text: 'Teachers',
                  icon: Icons.people,
                  onpress: () {
                    Get.toNamed('/teacherlist');
                  },
                ),
                buildMenuItem(
                  text: 'Assignment',
                  icon: Icons.wallpaper,
                  onpress: () {
                    Get.toNamed('/assignment');
                  },
                ),
                buildMenuItem(
                  text: 'Dormitory',
                  icon: Icons.hotel,
                  onpress: () {
                    // Get.toNamed('/login');
                  },
                ),
                buildMenuItem(
                  text: 'Transport',
                  icon: Icons.bus_alert,
                  onpress: () {
                    // Get.toNamed('/login');
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child:Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), bottomLeft:Radius.circular(10.0)),
                  color: Colors.grey.shade200,
                ),
                child: Stack(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 55.0),
                          child: CircleAvatar(
                            radius: 35.0,
                            backgroundColor: Colors.white,
                            child: Image(
                              image: AssetImage("images/excellogo.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Kashish Chaudhary',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.04,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Class: 4',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                    Text(
                                      'Roll: 6',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Container(
                  // height: MediaQuery.of(context).size.height / 1.5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.0),
                      NewTextField(

                        text: 'Search Functions',
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 20.0),
                        child: Text('Functionalities',
                            style:
                            TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500, fontFamily: 'OpenSans')),
                      ),

                      GridView.count(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        crossAxisCount: 4,
                        children: List.generate(model.length, (index) {
                          return Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 2,
                            margin: EdgeInsets.all(5.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),

                            child: Center(
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed : (){model[index].onpress();},
                                      icon: Icon(
                                        model[index].icon,
                                        size: 35.0,
                                        color: Colors.green.shade200,
                                      ),
                                    ),
                                    Text(model[index].text,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54,
                                            fontFamily: 'OpenSans'
                                        )),
                                  ]),
                            ),

                          );
                        }),
                      ),


                      // Divider(
                      //   thickness: 1.0,
                      //   color: Colors.black,
                      // ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
