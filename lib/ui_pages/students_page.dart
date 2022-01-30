import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/category_drawer.dart';
import 'package:new_project_work/widgets/student_work.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  // int _currentIndex = 0;
  // final screens = [
  //   Functions(),
  //   Calendar(),
  //   Settings(),
  //   Power(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: CategoryDrawer(),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [orangeColors, lightRedColors],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100))),
              ),
              // IconButton(
              //   onPressed: () => CategoryDrawer(),
              //   icon: Icon(Icons.menu),
              //   color: Colors.white,
              // ),
              Padding(
                padding: EdgeInsets.only(left: 90.0, top: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      // backgroundColor: Colors.white,
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/550x/7d/1a/3f/7d1a3f77eee9f34782c6f88e97a6c888.jpg"),
                    ),

                    Column(
                      children: [
                        Text(
                          'Kashish Chaudhary',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          height: 35.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Class: 4',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                'Roll: 6',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
          StudentWork(),
        ],
      ),

      // screens[_currentIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex : _currentIndex,
      //   backgroundColor: Colors.lightBlueAccent,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white54,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //       // backgroundColor: Colors.blue,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label:'Search',
      //       // backgroundColor: Colors.blue,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.calendar_today),
      //       label: 'Calendar',
      //       // backgroundColor: Colors.blue,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //       // backgroundColor: Colors.blue,
      //     ),
      //
      //   ],
      //   onTap: (index){
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      // ),
    );
  }
// Container buildMyNavBar(BuildContext context) {
//   return Container(
//     height: 60,
//     decoration: BoxDecoration(
//       color: Theme.of(context).primaryColor,
//       borderRadius: const BorderRadius.only(
//         topLeft: Radius.circular(20),
//         topRight: Radius.circular(20),
//       ),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         IconButton(
//           enableFeedback: false,
//           onPressed: () {
//             setState(() {
//               _currentIndex = 0;
//             });
//           },
//           icon: _currentIndex == 0
//               ? const Icon(
//             Icons.home_filled,
//             color: Colors.white,
//             size: 35,
//           )
//               : const Icon(
//             Icons.home_outlined,
//             color: Colors.white,
//             size: 35,
//           ),
//         ),
//         IconButton(
//           enableFeedback: false,
//           onPressed: () {
//             setState(() {
//               _currentIndex = 1;
//             });
//           },
//           icon: _currentIndex == 1
//               ? const Icon(
//             Icons.work_rounded,
//             color: Colors.white,
//             size: 35,
//           )
//               : const Icon(
//             Icons.work_outline_outlined,
//             color: Colors.white,
//             size: 35,
//           ),
//         ),
//         IconButton(
//           enableFeedback: false,
//           onPressed: () {
//             setState(() {
//               _currentIndex = 2;
//             });
//           },
//           icon: _currentIndex == 2
//               ? const Icon(
//             Icons.widgets_rounded,
//             color: Colors.white,
//             size: 35,
//           )
//               : const Icon(
//             Icons.widgets_outlined,
//             color: Colors.white,
//             size: 35,
//           ),
//         ),
//         IconButton(
//           enableFeedback: false,
//           onPressed: () {
//             setState(() {
//               _currentIndex = 3;
//             });
//           },
//           icon: _currentIndex == 3
//               ? const Icon(
//             Icons.person,
//             color: Colors.white,
//             size: 35,
//           )
//               : const Icon(
//             Icons.person_outline,
//             color: Colors.white,
//             size: 35,
//           ),
//         ),
//       ],
//     ),
//   );
// }
}

// class NewClass extends StatefulWidget {
//   const NewClass({Key? key}) : super(key: key);
//
//   @override
//   _NewClassState createState() => _NewClassState();
// }
//
// class _NewClassState extends State<NewClass> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       scrollDirection: Axis.vertical,
//       children: [
//
//         Stack(
//           children: [
//             Container(
//               height: MediaQuery
//                   .of(context)
//                   .size
//                   .height * 0.4,
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [orangeColors, lightRedColors],
//                       end: Alignment.bottomCenter,
//                       begin: Alignment.topCenter),
//                   borderRadius:
//                   BorderRadius.only(bottomLeft: Radius.circular(100))),
//             ),
//
//             IconButton(
//               onPressed: () => CategoryDrawer(),
//               icon: Icon(Icons.menu),
//               color: Colors.white,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 90.0, top: 30.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     // backgroundColor: Colors.white,
//                     radius: 50.0,
//                     backgroundImage: NetworkImage(
//                         "https://i.pinimg.com/550x/7d/1a/3f/7d1a3f77eee9f34782c6f88e97a6c888.jpg"),
//                   ),
//                   Column(
//
//                     children: [
//                       Text(
//                         'Kashish Chaudhary',
//                         style: TextStyle(
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       SizedBox(height: 10.0),
//                       Container(
//                         height: 35.0,
//                         width: 200.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15.0),
//                           color: Colors.white,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               'Class: 4',
//                               style: TextStyle(
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black),
//                             ),
//                             Text(
//                               'Roll: 6',
//                               style: TextStyle(
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 20.0,),
//           ],
//         ),
//
//         StudentWork(),
//       ],
//     );
//   }
// }
//
