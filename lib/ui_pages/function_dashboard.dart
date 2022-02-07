import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/controller/grid_view_controller.dart';
import 'package:new_project_work/models/gird_view_list.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.lightBlueAccent,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.white54,
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

// Widget _buildPopupDialog(BuildContext context) {
//   return AlertDialog(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(20.0),
//     ),
//     backgroundColor: Colors.white,
//     title: Center(
//         child: Text(
//       'Do you want to LOG OUT ?',
//       style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'MontserratAlternates'),
//     )),
//     content: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(right: 14.0),
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('No',style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'MontserratAlternates')),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right: 14.0),
//           child: ElevatedButton(
//             onPressed: () {
//               Get.toNamed('/login');
//             },
//             child: Text('Yes',style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'MontserratAlternates')),
//           ),
//         ),
//       ],
//     ),
//   );
// }

class Functions extends StatefulWidget {
  const Functions({Key? key}) : super(key: key);

  @override
  _FunctionsState createState() => _FunctionsState();
}

class _FunctionsState extends State<Functions> {
  final gridController = Get.put(GridController());

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

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.blue,
        elevation: 1.0,
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
              icon: Icon(Icons.power_settings_new,
                  color: Colors.white, size: 25.0),
            ),
          ),
        ],
      ),
      drawer: Drawer(

        elevation: 3.0,
        child: Container(
          color: Colors.lightBlueAccent,
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
                  // Get.toNamed('/login');
                },
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
                icon: Icons.power_settings_new,
                onpress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        BuildPopupDialog(),
                  );
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
                color: Colors.blue,
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
                          radius: 30.0,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("images/excellogo.png"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.0, left: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Kashish Chaudhary',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                                fontFamily: 'MontserratAlternates',
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
                                      color: Colors.black87,
                                      fontFamily: 'MontserratAlternates',
                                    ),
                                  ),
                                  Text(
                                    'Roll: 6',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontFamily: 'MontserratAlternates',
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
                  color: Colors.white,
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
                          TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500, fontFamily: 'MontserratAlternates')),
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
                                  // Icon(
                                  //   controller.girdList[index].icon,
                                  // ),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     model[index].onpress();
                                  //   },
                                  //   child: ClipRRect(
                                  //     borderRadius: BorderRadius.circular(20.0),
                                  //     child: Image(
                                  //       height: 150,
                                  //       width: 150,
                                  //       image: AssetImage(model[index].icon),
                                  //       fit: BoxFit.cover,
                                  //     ),
                                  //   ),
                                  // ),
                                  IconButton(
                                    onPressed : (){model[index].onpress();},
                                    icon: Icon(
                                      model[index].icon,
                                      size: 35.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Text(model[index].text,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54,
                                          fontFamily: 'MontserratAlternates'
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
    );
  }
}

// ListView(
//   shrinkWrap: true,
//   scrollDirection: Axis.vertical,
//   children: [
//
//
//
//
//
//
//   ],
// ),