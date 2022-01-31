
import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/admin_bio.dart';
import 'package:new_project_work/ui_pages/calendar.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/ui_pages/power.dart';
import 'package:new_project_work/ui_pages/settings.dart';
import 'package:new_project_work/ui_pages/students_page.dart';

class GradStudent extends StatefulWidget {
  const GradStudent({Key? key}) : super(key: key);

  @override
  _GradStudentState createState() => _GradStudentState();
}

class _GradStudentState extends State<GradStudent> {
  // int _page = 0;
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

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
    Power(),
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
            icon: GestureDetector(
              onDoubleTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              child: Icon(Icons.home),
            ),
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
            icon: Icon(Icons.power_settings_new),
            label: 'Power-Off',
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
                      onPressed: () {},
                      icon: Icon(Icons.menu, color: Colors.black, size: 25.0),
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
            GridView.count(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              children: List.generate(models.length, (index) {
                return Center(
                  child: ModelCard(model: models[index]),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}

class Model {
  const Model({required this.text, required this.icon, required this.onpress});

  final String text;
  final IconData icon;
  final Function onpress;

// final Size size;
}

List<Model> models = <Model>[
  Model(
      text: 'Profile',
      icon: Icons.person,
      onpress: () {
        // Navigator.push(context, MaterialPageRoute((context) => Dashboard()));
      }),
  Model(
      text: 'Fees',
      icon: Icons.event_note_rounded,
      onpress: () {
        print('pressed');
      }),
  Model(
      text: 'Result',
      icon: Icons.file_copy_sharp,
      onpress: () {
        print('pressed');
      }),
  Model(
      text: 'Attendance',
      icon: Icons.home_work_outlined,
      onpress: () {
        print('pressed');
      }),
  Model(
      text: 'Subjects',
      icon: Icons.subject,
      onpress: () {
        print('pressed');
      }),
  Model(
      text: 'Downloads',
      icon: Icons.download_rounded,
      onpress: () {
        print('pressed');
      }),
  Model(
      text: 'Routine',
      icon: Icons.request_page_outlined,
      onpress: () {
        print('pressed');
      }),
  Model(
      text: 'Library',
      icon: Icons.library_books_sharp,
      onpress: () {
        print('pressed');
      }),
  Model(
      text: 'Teachers',
      icon: Icons.people,
      onpress: () {
        print('pressed');
      }),
  Model(
      text: 'Exam',
      icon: Icons.wallpaper,
      onpress: () {
        print('pressed');
      }),
  Model(
      text: 'Dormitory',
      icon: Icons.hotel,
      onpress: () {
        print('pressed');
      }),
  Model(
      text: 'Transport',
      icon: Icons.bus_alert,
      onpress: () {
        print('pressed');
      }),
];

class ModelCard extends StatelessWidget {
  // const ModelCard({Key? key}) : super(key: key);
  final Model model;

  const ModelCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final TextStyle textStyle = Theme.of(context).textTheme.caption;
    return Card(
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
              IconButton(
                onPressed: () => model.onpress,
                icon: Icon(
                  model.icon,
                  size: 25.0,
                  color: Colors.blue,
                ),
                // size: 25.0, color: Colors.blue,
              ),
              // SizedBox(height: 6.0),
              Text(model.text,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87)),
            ]),
      ),
    );
  }
}
