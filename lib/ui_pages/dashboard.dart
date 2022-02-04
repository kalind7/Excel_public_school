import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_project_work/models/dashboard_list.dart';
import 'package:new_project_work/ui_pages/function_dashboard.dart';
import 'package:new_project_work/ui_pages/list_of_students.dart';
import 'package:new_project_work/ui_pages/list_of_teacher.dart';
import 'package:new_project_work/ui_pages/splash_screen.dart';
import 'package:new_project_work/widgets/admin_bio.dart';
import 'package:new_project_work/widgets/build_menu_item.dart';
import 'package:new_project_work/widgets/notice.dart';
import 'package:new_project_work/widgets/text_field.dart';

class Dashboard extends StatefulWidget {




  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  void _showToast() {
    Fluttertoast.showToast(
      msg: 'Staff list not made',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color(0xffef5350),
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {

    // List<Modelss> newModels = [
    //   Modelss(
    //       title: 'We have',
    //       description: '3000+ Students',
    //       onpress: (){
    //         Navigator.push(context, MaterialPageRoute(builder: (context) => StudentLists()));
    //       },
    //       image: 'images/profile.png'
    //   ),
    //   Modelss(
    //       title: 'We have',
    //       description: '200+ Teachers',
    //       onpress: (){
    //         Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherLists()));
    //       },
    //       image: 'images/teacher.webp'
    //   ),
    //   Modelss(
    //       title: 'We have',
    //       description: '400+ Staffs',
    //       onpress: (){
    //         return _showToast();
    //       },
    //       image: 'images/profile.png'
    //   ),
    // ];


    return Scaffold(
      appBar: AppBar(

        title: Text('Dashboard'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 3.0, top: 2.0),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("images/profile.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kalind Koirala',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          'Admin',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              buildMenuItem(
                text: 'Profile',
                icon: Icons.person,
                onpress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminBio(
                                text: 'Kalind Koirala',
                                bio:
                                    'My name is Kalind and I am a freelance mobile app developer\n If you need any mobile app for your company then contact me for more informations. ',
                                jobtitle: 'Job',
                                answer1: 'App Developer',
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
                  Get.toNamed('/login');
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
                icon: Icons.power_settings_new,
                onpress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),

                NewTextField(text: 'Search'),

                // ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   shrinkWrap: true,
                //   physics: ClampingScrollPhysics(),
                //   itemCount: newModels.length,
                //     itemBuilder: (context, index){
                //         return  Container(
                //           margin: EdgeInsets.only(top: 20.0),
                //           height: MediaQuery.of(context).size.height * 0.17,
                //           width: MediaQuery.of(context).size.width / 1.2 ,
                //           decoration: BoxDecoration(
                //               color: Colors.white,
                //               border: Border.all(color: HexColor("#F4F4F4")),
                //               borderRadius: BorderRadius.circular(15.0),
                //               boxShadow: [
                //                 BoxShadow(
                //                   color: Colors.grey.withOpacity(.08),
                //                   spreadRadius: 5,
                //                   blurRadius: 7,
                //                   offset: Offset(4, 3), // changes position of shadow
                //                 ),
                //               ]),
                //           child: Row(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               CircleAvatar(
                //                 backgroundColor: Colors.white,
                //                 radius: 30.0,
                //                 backgroundImage: AssetImage(newModels[index].image),
                //               ),
                //               Column(
                //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text(newModels[index].title,style: TextStyle(fontSize: 16.0, fontFamily: 'MontserratAlternates', fontWeight: FontWeight.w500)),
                //
                //                   Padding(
                //                     padding: EdgeInsets.only(bottom: 15.0),
                //                     child:InkWell(
                //                       onTap: () {newModels[index].onpress();},
                //                       child: Center(
                //                         child: Text(
                //                           newModels[index].description,
                //                           style: TextStyle(
                //                             fontSize: 24.0,
                //                             fontFamily: 'MontserratAlternates', fontWeight: FontWeight.bold,
                //                             color: Colors.blue,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //
                //             ],
                //           ),
                //         );
                //     }
                // ),
                //
                // SizedBox(
                //   height: 20,
                // ),
                //
                // Text('Notice Board', style: TextStyle(
                //   fontSize: 24.0,
                //   fontFamily: 'MontserratAlternates', fontWeight: FontWeight.bold,
                //   color: Colors.blue,
                // ),),
                //
                // SizedBox(
                //   height: 20,
                // ),

                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        transitionDuration:
                                            Duration(seconds: 1),
                                        transitionsBuilder: (context, animation,
                                            animationTime, child) {
                                          //  animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
                                          return ScaleTransition(
                                            alignment: Alignment.center,
                                            scale: animation,
                                            child: child,
                                          );
                                        },
                                        pageBuilder: (context, animation,
                                            animationTime) {
                                          return StudentLists();
                                        }));
                              },
                              child: Image.network(
                                "https://st2.depositphotos.com/5425740/9532/v/380/depositphotos_95328970-stock-illustration-vector-group-of-students.jpg",
                                height: 120,
                              ),
                            ),
                            Text('All Students'),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GradStudent()));
                              },
                              child: Image.network(
                                "https://www.vettrak.com.au/wp-content/uploads/2020/02/international_students.png",
                                height: 120,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GradStudent()));
                              },
                              child: Text('Functions Dashboard'),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/events');
                              },
                              child: Image.network(
                                "https://www.proeves.com/blog/wp-content/uploads/2019/01/events_kids.jpg",
                                height: 120,
                              ),
                            ),
                            Text('Upcoming Events'),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              "https://pngimage.net/wp-content/uploads/2018/06/homework-cartoon-png-2.png",
                              height: 120,
                            ),
                            Text('Exam Results'),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              "https://i.pinimg.com/originals/55/69/55/5569554b4d8a9bb11965949e1af08dbf.png",
                              height: 120,
                            ),
                            Text('Teachers Record'),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildPopupDialog(context),
                                );
                              },
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTku2oJC2M9rZu0jq3hLd7n_lgwUEFudUCVLu_XOo7bY0V_7ih5LsWA9p2LBVPFNkbVZx8&usqp=CAU",
                                height: 120,
                              ),
                            ),
                            Text('Logout'),
                          ],
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


