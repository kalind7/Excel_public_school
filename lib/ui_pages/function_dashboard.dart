import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/controller/grid_view_controller.dart';
import 'package:new_project_work/models/gird_view_list.dart';
import 'package:new_project_work/widgets/admin_bio.dart';
import 'package:new_project_work/ui_pages/calendar.dart';
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

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    backgroundColor: Colors.white,
    title: Center(
        child: Text(
          'Do you want to LOG OUT ?',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        )),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 14.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 14.0),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed('/login');
            },
            child: Text('Yes'),
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


  @override
  Widget build(BuildContext context) {

    List<Model> model = [
      // Model(text: 'text', icon: Icons.arrow_forward),
      Model(
        text: 'Profile',
        icon: 'images/profile.png',
        onpress : () {
          print ('anything');
          Navigator.push(context, MaterialPageRoute(builder: (context)  =>AdminBio(
            text: 'Kashish Chaudhary',
            bio:
            'I am student of class 4 and am studying hardly to complete my primary classes.',
            jobtitle: 'Job',
            answer1: 'Student',
            length: 'Class',
            answer2: '4',
            question: 'Teacher ?',
            answer3: 'NO',
          ), ));
        },
      ),

      Model(
        text: 'Fees',
        icon: 'images/fees.jpg',
        onpress : () {
          print ('anything');
        },
      ),
      Model(
        text: 'Result',
        icon: 'images/result.jpg',
        onpress : () {
          print ('anything');
        },
      ),
      Model(
        text: 'Attendance',
        icon: 'images/attendance.jpg',
        onpress : () {
          print ('anything');
         Get.toNamed('/attendance');
        },
      ),
      Model(
        text: 'Subjects',
        icon: 'images/subjects.jpg',
        onpress : () {
          print ('anything');
        },
      ),
      Model(
        text: 'Downloads',
        icon: 'images/downloads.webp',
        onpress : () {
          print ('anything');

        },
      ),
      Model(
        text: 'Routine',
        icon: 'images/routine.webp',
        onpress : () {
          print ('anything');

        },
      ),
      Model(
        text: 'Library',
        icon: 'images/library.jpg',
        onpress : () {
        print ('anything');

      },
      ),
      Model(
        text: 'Teachers',
        icon: 'images/teacher.webp',
        onpress : () {
          print ('anything');
          Get.toNamed('/teacherlist');
        },
      ),
      Model(
        text: 'Exam',
        icon: 'images/exam.jpg',
        onpress : () {
          print ('anything');

        },
      ),
      Model(
        text: 'Dormitory',
        icon: 'images/dormitory.webp',
        onpress : () {
        print ('anything');
      },
      ),
      Model(
        text: 'Transport',
        icon: 'images/bus2.jpg',
        onpress : () {
          print ('anything');

        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        // title: Text('Functions'),
        // centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 3.0,top: 2.0),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
              },
              icon: Icon(Icons.power_settings_new, color: Colors.white, size: 25.0),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 3.0,
        child: Container(
          color: Colors.lightBlueAccent,
          child: ListView(
            children:<Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.0 ),
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("images/excellogo.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0 ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kashish Chaudhary',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          height: 35.0,
                          width: 150.0,
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
                                    color: Colors.black87),
                              ),

                              Text(
                                'Roll: 6',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),

              buildMenuItem(
                text: 'Dashboard',
                icon: Icons.dashboard,
                onpress: (){
                  Get.toNamed('/dashboard');
                },
              ),

              buildMenuItem(
                text: 'Profile',
                icon: Icons.person,
                onpress: (){
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Fees',
                icon: Icons.event_note_rounded,
                onpress: (){
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Result',
                icon: Icons.file_copy_sharp,
                onpress: (){
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Attendance',
                icon: Icons.home_work_outlined,
                onpress: (){
                  Get.toNamed('/attendance');
                },
              ),
              buildMenuItem(
                text: 'Subjects',
                icon: Icons.subject,
                onpress: (){
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Downloads',
                icon: Icons.download_rounded,
                onpress: (){
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Routine',
                icon: Icons.request_page_outlined,
                onpress: (){
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Library',
                icon: Icons.library_books_sharp,
                onpress: (){
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Teachers',
                icon: Icons.people,
                onpress: (){
                  Get.toNamed('/teacherlist');
                },
              ),
              buildMenuItem(
                text: 'Exam',
                icon: Icons.wallpaper,
                onpress: (){
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Dormitory',
                icon: Icons.hotel,
                onpress: (){
                  Get.toNamed('/login');
                },
              ),
              buildMenuItem(
                text: 'Transport',
                icon: Icons.bus_alert,
                onpress: (){
                  Get.toNamed('/login');
                },
              ),

              Divider(
                color: Colors.black87,
                thickness: 1,
              ),

              buildMenuItem(
                text: 'Logout',
                icon: Icons.power_settings_new,
                onpress: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _buildPopupDialog(context),
                  );
                },
              ),

            ],
          ),
        ),
      ),

      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 10.0),

              NewTextField(text: 'Search Functions',),

              Padding(
                padding: EdgeInsets.only(left: 15.0,top: 20.0),
                child: Text('Functionalities',
                    style:
                    TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500)),
              ),

              GridView.count(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(model.length, (index) {
                  return   Container(
                    height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Icon(
                                //   controller.girdList[index].icon,
                                // ),


                                GestureDetector(
                                  onTap: (){model[index].onpress();},
                                  child : ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child:Image(
                                      height: 150,
                                      width: 150,
                                      image: AssetImage(model[index].icon),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                // IconButton(
                                //   onPressed : (){model[index].onpress();},
                                //   icon: Icon(
                                //     model[index].icon,
                                //     size: 25.0,
                                //     color: Colors.white,
                                //   ),
                                // ),
                                Text(model[index].text,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                              ]),
                        ),
                      );

                }),
              ),

            ],
          ),
        ],
      ),
    );
  }
}

