import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/function_dashboard.dart';
import 'package:new_project_work/ui_pages/students_page.dart';
import 'package:new_project_work/ui_pages/list_of_students.dart';
import 'package:new_project_work/widgets/category_drawer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: CategoryDrawer(),
      ),
      body: Stack(
        children: <Widget>[
          // HeaderContainer(text: 'Admin'),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: Image.network(
                        "https://mars-metcdn-com.global.ssl.fastly.net/content/uploads/sites/101/2019/04/30162428/Top-Header-Background.png")
                    .image,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('images/excellogo.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Kalind Koirala',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                          Text(
                            'Admin',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 50,),
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
                                          return BuildList();
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
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GradStudent()));
                            },
                            child:  Text('Functions Dashboard'),
                          ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            GestureDetector(
                               onTap: (){
                                 Get.toNamed('/events');
                               } ,

                              child:  Image.network(
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
                            Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTku2oJC2M9rZu0jq3hLd7n_lgwUEFudUCVLu_XOo7bY0V_7ih5LsWA9p2LBVPFNkbVZx8&usqp=CAU",
                              height: 120,
                            ),
                            Text('Logout'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
