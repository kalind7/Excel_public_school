import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/controller/grid_view_controller.dart';

// import 'package:new_project_work/models/gird_view_list.dart';
import 'package:new_project_work/ui_pages/admin_bio.dart';
import 'package:new_project_work/ui_pages/calendar.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
// import 'package:new_project_work/ui_pages/power.dart';
import 'package:new_project_work/ui_pages/settings.dart';

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
    Settings(),
    Dashboard(),
    // AlertDialog(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(20.0),
    //   ),
    //   backgroundColor: Colors.white,
    //   title: Center(
    //       child: Text(
    //         'LOG OUT!!',
    //         style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    //       )),
    //   content: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.only(right: 14.0),
    //         child: ElevatedButton(
    //           onPressed: () {
    //             Get.toNamed('/login');
    //           },
    //           child: Text('Logout'),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
    // P
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CurvedNavigationBar(
      //
      //   key: _bottomNavigationKey,
      //   index: 0,
      //   height: 40.0,
      //   backgroundColor: Colors.blueAccent,
      //   items: <Widget>[
      //     Icon(Icons.home,size: 25.0,semanticLabel: 'Home',),
      //     Icon(Icons.settings,size: 25.0,semanticLabel: 'settings',),
      //     Icon(Icons.calendar_today,size: 25.0,semanticLabel: 'calendar',),
      //     Icon(Icons.power_settings_new,size: 25.0,semanticLabel: 'power',),
      //   ],
      //
      //   color: Colors.white,
      //   buttonBackgroundColor: Colors.white24,
      //   animationCurve: Curves.bounceInOut,
      //   animationDuration: Duration(microseconds: 500),
      //   onTap: (index){
      //     setState(() {
      //       _page = index;
      //       // _currentIndex = index;
      //     });
      //   },
      //   letIndexChange: (index) => true,
      // ),
      body: screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.lightBlueAccent,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.white54,
        items: [
          BottomNavigationBarItem(
            icon:  Icon(Icons.home),
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
            icon: Icon(Icons.settings),
            label: 'Settings',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
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

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    backgroundColor: Colors.white,
    title: Center(
        child: Text(
          'LOG OUT!!',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        )),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 14.0),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed('/login');
            },
            child: Text('Logout'),
          ),
        ),
      ],
    ),
  );
}

class Functions extends StatefulWidget {
  const Functions({Key? key}) : super(key: key);

  @override
  _FunctionsState createState() => _FunctionsState();
}

class _FunctionsState extends State<Functions> {
  final gridController = Get.put(GridController());

  // List<Model> models = [
  //
  //   Model(
  //       text: 'Profile',
  //       icon: Icons.person,
  //       onpress: () {
  //         // Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
  //       }),
  //   Model(
  //       text: 'Fees',
  //       icon: Icons.event_note_rounded,
  //       onpress: () {
  //         print('pressed');
  //       }),
  //   Model(
  //       text: 'Result',
  //       icon: Icons.file_copy_sharp,
  //       onpress: () {
  //         print('not pressed');
  //       }),
  //   Model(
  //       text: 'Attendance',
  //       icon: Icons.home_work_outlined,
  //       onpress: () {
  //         print('pressed');
  //       }),
  //   Model(
  //       text: 'Subjects',
  //       icon: Icons.subject,
  //       onpress: () {
  //         print('pressed');
  //       }),
  //   Model(
  //       text: 'Downloads',
  //       icon: Icons.download_rounded,
  //       onpress: () {
  //         print('pressed');
  //       }),
  //   Model(
  //       text: 'Routine',
  //       icon: Icons.request_page_outlined,
  //       onpress: () {
  //         print('pressed');
  //       }),
  //   Model(
  //       text: 'Library',
  //       icon: Icons.library_books_sharp,
  //       onpress: () {
  //         print('pressed');
  //       }),
  //   Model(
  //       text: 'Teachers',
  //       icon: Icons.people,
  //       onpress: () {
  //         print('pressed');
  //       }),
  //   Model(
  //       text: 'Exam',
  //       icon: Icons.wallpaper,
  //       onpress: () {
  //         print('pressed');
  //       }),
  //   Model(
  //       text: 'Dormitory',
  //       icon: Icons.hotel,
  //       onpress: () {
  //         print('pressed');
  //       }),
  //   Model(
  //       text: 'Transport',
  //       icon: Icons.bus_alert,
  //       onpress: () {
  //         print('pressed');
  //       }),
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: 400,
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              // color: Colors.blue,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, right: 55.0),
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage("images/profile.png"),
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 5.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, color: Colors.black, size: 25.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 5.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_active,
                          color: Colors.black, size: 25.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 5.0),
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupDialog(context),
                        );
                      },
                      icon: Icon(Icons.power_settings_new, color: Colors.black, size: 25.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('Functionalities',
                  style:
                      TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 20.0),
            GetX<GridController>(builder: (controller) {
              return GridView.count(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                crossAxisCount: 4,
                children: List.generate(controller.girdList.length, (index) {
                  return Center(
                    child: Card(
                      elevation: 3.0,
                      // margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.white,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Icon(
                              //   controller.girdList[index].icon,
                              // ),

                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  controller.girdList[index].icon,
                                  size: 25.0,
                                  color: Colors.blue,
                                ),
                              ),
                              Text(controller.girdList[index].text,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black87)),
                            ]),
                      ),
                    ),
                  );
                }),
              );
            }),
          ],
        ),
      ],
    );
  }
}

// class ModelCard extends StatelessWidget {
//   // const ModelCard({Key? key}) : super(key: key);
//
//
//   const ModelCard({Key? key, required this.model}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     // final TextStyle textStyle = Theme.of(context).textTheme.caption;
//     return
//   }
// }
