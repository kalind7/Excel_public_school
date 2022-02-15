import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/controller/grid_view_controller.dart';
import 'package:new_project_work/models/gird_view_list.dart';
import 'package:new_project_work/ui_pages/fees.dart';
import 'package:new_project_work/ui_pages/library.dart';
import 'package:new_project_work/ui_pages/settings.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/admin_bio.dart';
import 'package:new_project_work/ui_pages/calendar.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/category_drawer.dart';
import 'package:new_project_work/widgets/logout_popup.dart';
import 'package:new_project_work/ui_pages/notice.dart';
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
        backgroundColor: orangeOne,
        selectedItemColor: redTwo,
        unselectedItemColor: Colors.white70,
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: WidgetAppbar(
            title: '',
            onPress: () => _scaffoldKey.currentState!.openDrawer(),
            icon: Icons.menu,
          ),
        ),
        drawer: CategoryDrawer(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child:Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 5.0),
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
                            radius: 32.0,
                            backgroundColor: Colors.white,
                            child: Image(
                              image: AssetImage("images/excellogo.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0, left: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Kashish Chaudhary',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: redTwo,
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
                                  border: Border.all(color: orangeOne, width: 0.5)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Class: 4',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: redOne,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                    Text(
                                      'Roll: 6',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: redOne,
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
                        padding: EdgeInsets.only(left: 15.0, top: 10.0),
                        child: Text('Functionalities',
                            style:
                            TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, fontFamily: 'OpenSans', color: redTwo)),
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
                                        color: orangeTwo,
                                      ),
                                    ),
                                    Text(model[index].text,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: redTwo,
                                            fontFamily: 'Roboto'
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
