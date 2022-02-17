import 'package:excel_public_school/models/grid_view_model.dart';
import 'package:excel_public_school/ui_pages/admin_bio.dart';
import 'package:excel_public_school/ui_pages/calendar.dart';
import 'package:excel_public_school/ui_pages/notice.dart';
import 'package:excel_public_school/ui_pages/settings.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/widgets/category_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final screens = const [
     Functions(),
     AdminBio(
      text: 'Kashish Chaudhary',
      bio:
      'I am student of class 4 and am studying hardly to complete my primary classes.',
      jobTitle: 'Job',
      answer1: 'Student',
      length: 'Class',
      answer2: '4',
      question: 'Teacher ?',
      answer3: 'NO',
    ),
     Calendar(),
     Notice(),
     Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: HexColor('#E1E5EC'),
        selectedItemColor: orangeOne,
        unselectedItemColor: pinkOne,
        items: const [
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
  

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    List<Model> model = [
      // Model(text: 'text', icon: Icons.arrow_forward),
      Model(
        text: 'Online Class',
        iconTitle: 'files/icons/onlineClass.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdminBio(
                  text: 'Kashish Chaudhary',
                  bio:
                  'I am student of class 4 and am studying hardly to complete my primary classes.',
                  jobTitle: 'Job',
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
        iconTitle: 'files/icons/fees.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> Fees()));
        },
      ),
      Model(
        text: 'Result',
        iconTitle: 'files/icons/results.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Attendance',
        iconTitle: 'files/icons/attendance.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }

        },
      ),
      Model(
        text: 'Subjects',
        iconTitle: 'files/icons/subjects.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Routine',
        iconTitle: 'files/icons/routine.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),
      Model(
        text: 'Library',
        iconTitle: 'files/icons/library.jpg',
        onPress: () {
          Get.toNamed('/routine');
        },
      ),
      Model(
        text: 'Online Exam',
        iconTitle: 'files/icons/onlineExam.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Library()));
        },
      ),
      Model(
        text: 'Teachers',
        iconTitle: 'files/icons/teacher.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          // Get.toNamed('/teacherlist');
        },
      ),
      Model(
        text: 'Dormitory',
        iconTitle: 'files/icons/dorm.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
          // Get.toNamed('/assignment');
        },
      ),
    Model(
    text: 'Transport',
      iconTitle: 'files/icons/bus.jpg',
    onPress: () {
    if (kDebugMode) {
    print('anything');
    }
    },
    ),
      Model(
        text: 'Download',
        iconTitle: 'files/icons/download.jpg',
        onPress: () {
          if (kDebugMode) {
            print('anything');
          }
        },
      ),

    ];

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const CategoryDrawer(),
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height /2.5,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height /3.5,
                    width: MediaQuery.of(context).size.width ,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [pinkOne, orangeOne, orangeOne],
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter),
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0))
                    ),
                    child: ListView(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){
                              _scaffoldKey.currentState!.openDrawer();
                            },icon: SvgPicture.asset('files/icons/four_bar_menu.svg'),),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.6 ,),
                            IconButton(onPressed: (){},icon: SvgPicture.asset('files/icons/search.svg'),),
                            IconButton(onPressed: (){},icon: SvgPicture.asset('files/icons/menu.svg'),),
                          ],
                        ),

                        const Align(
                          alignment: Alignment.topCenter,
                          child:  Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child:  CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.grey,
                              child: Image(
                                height: 75,
                                width: 75,
                                image: AssetImage('files/images/excellogo.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Stack(
                    children: [
                      ClipPath(
                        clipper: MyCustomClipper(),
                        child: Container(
                          margin: const EdgeInsets.only(top: 140.0,left: 20,right: 20),
                          height: MediaQuery.of(context).size.height * 0.125,
                          width: MediaQuery.of(context).size.width ,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(width: .5, color: orangeOne),
                            boxShadow: [
                              BoxShadow(
                                color: orangeOne.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 2,
                                offset: const Offset(0, 9), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Ram Bahadur Aryal', style: TextStyle(fontSize: 24.0,fontFamily: 'OpenSans',fontWeight: FontWeight.w600,color: pinkOne),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              crossAxisCount: 4,
              children: List.generate(model.length, (index) {
                return Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2,
                  shadowColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(width: 1.0, color: orangeOne),
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  child: Center(
                    child: Column(mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed : (){model[index].onPress();},
                            icon:  Image.asset(model[index].iconTitle),
                            iconSize: 40.0,
                          ),
                          Text(model[index].text,
                              style: cardTitle
                          ),
                        ]),
                  ),

                );
              }),
            ),

          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double offset = 100.0;
    Path path = Path();
    path.lineTo(width, 0);
    // path.quadraticBezierTo(height/2, width , height, width-offset);
    path.lineTo(width, height);
    path.lineTo(0, height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}

