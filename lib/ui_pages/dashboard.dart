import 'package:excel_public_school/models/grid_view_model.dart';
import 'package:excel_public_school/ui_pages/admin_bio.dart';
import 'package:excel_public_school/ui_pages/calendar.dart';
import 'package:excel_public_school/ui_pages/notice.dart';
import 'package:excel_public_school/ui_pages/settings.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/widgets/category_drawer.dart';
import 'package:excel_public_school/widgets/logout_popup.dart';
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

  bool _showNotch = true;
  final FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.centerDocked;

  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch = value;
    });
  }

  final int _currentIndex = 0;
  final screens =  [
     const Functions(),
      AdminBio(),
     const Calendar(),
     const Notice(),
     const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      floatingActionButton: _showNotch? FloatingActionButton(

        splashColor: pinkOne,
        backgroundColor: HexColor('#E1E5EC'),
        onPressed: (){},
        tooltip: 'Home',
        child: ImageIcon(AssetImage('files/bottom_navbar_icons/home.png'),color: pinkOne,size: 40,),
      ): null,
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: _CustomBottomAppBar(
        fabLocation:  _fabLocation,
        shape: _showNotch ? const CircularNotchedRectangle(): null,
      ),
    );
  }
}

class _CustomBottomAppBar extends StatelessWidget{
  const _CustomBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.centerDocked,
    this.shape = const CircularNotchedRectangle(),
});
  
  final FloatingActionButtonLocation fabLocation ;
  final NotchedShape? shape;

  // static final List<FloatingActionButtonLocation> centerLocations =
  // <FloatingActionButtonLocation>[
  //   FloatingActionButtonLocation.centerDocked,
  //   FloatingActionButtonLocation.centerFloat,
  // ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: HexColor('##E1E5EC'),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget> [
            IconButton(
              tooltip: 'Profile',
              onPressed: (){},
              color: pinkOne,
              icon: ImageIcon(AssetImage('files/bottom_navbar_icons/profile.png'),size: 35 ,semanticLabel: 'Notice',),
            ),

            IconButton(
              padding: EdgeInsets.only(right: 20),
              tooltip: 'Calendar',
              onPressed: (){},
              color: pinkOne,
              icon: ImageIcon(AssetImage('files/bottom_navbar_icons/calendar.png'),size: 35 ,semanticLabel: 'Notice',),
            ),

            IconButton(
              padding: EdgeInsets.only(left: 20),
              tooltip: 'Homework',
              onPressed: (){},
              color: pinkOne,
              icon: ImageIcon(AssetImage('files/bottom_navbar_icons/homework.png'),size: 35 ,semanticLabel: 'Notice',),
            ),

            IconButton(

              tooltip: 'Notice',
              onPressed: (){},
              color: pinkOne,
              icon: ImageIcon(AssetImage('files/bottom_navbar_icons/notice.png'),size: 35 ,semanticLabel: 'Notice',),
            ),

          ],
        ),
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
                builder: (context) =>  AdminBio(

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
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){
                              _scaffoldKey.currentState!.openDrawer();
                            }, icon: SvgPicture.asset('files/icons/four_bar_menu.svg'),),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.6 ,),
                            IconButton(onPressed: (){},icon: SvgPicture.asset('files/icons/search.svg'),),


                            PopupMenuButton<int>(
                              icon: SvgPicture.asset('files/icons/menu.svg'),
                                color: Colors.white,
                                itemBuilder: (context) => [
                                   const PopupMenuItem<int>(
                                    value: 0,
                                      child: Text('Setting', style: drawerTitle,),
                                  ),

                                  const PopupMenuItem<int>(
                                    value: 1,
                                    child: Text('Privacy Policy Page', style: drawerTitle,),
                                  ),

                                  const PopupMenuDivider(),

                                  PopupMenuItem<int>(
                                    value: 2,
                                    child: Row(
                                      children:const [
                                        Icon(
                                          Icons.logout,
                                          color: Colors.red,
                                        ),
                                         SizedBox(
                                          width: 7,
                                        ),
                                        Text("Logout", style: drawerTitle,),
                                      ],
                                    ),
                                  ),
                                ],
                              onSelected: (item) => SelectedItem(context, item),
                            ),

                            // IconButton(onPressed: (){},icon: SvgPicture.asset('files/icons/menu.svg'),),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Stack(
                    children: [

                      const Align(
                        alignment: Alignment.center,
                        child:  Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 15, 50),
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

                   Container(
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
                            iconSize: 30.0,
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

void SelectedItem(BuildContext context, item) {
  switch (item) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Settings()));
      break;
    case 1:
      if (kDebugMode) {
        print("Privacy Clicked");
      }
      break;
    case 2:
      if (kDebugMode) {
        print("User Logged out");
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const BuildPopupDialog();
          });
  }
}
// class MyCustomClipper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//     double width = size.width;
//     double height = size.height;
//     Path path = Path();
//     // path.lineTo(0 , height);
//     // var firstStart = Offset(width /2 , height);
//     // var firstEnd = Offset(width/1.15 , height- 25 );
//     // path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
//
//     path.lineTo(width, height);
//     var secondStart = Offset(width - (width / 2),height - 20);
//     var secondEnd = Offset(width, height - 15);
//     path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
//
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
//
// }

// BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _currentIndex,
//         backgroundColor: HexColor('#E1E5EC'),
//         selectedItemColor: orangeOne,
//         unselectedItemColor: pinkOne,
//         items: const [
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage('files/bottom_navbar_icons/home.png')),
//             label: 'Home',
//             // backgroundColor: Colors.blue,
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage('files/bottom_navbar_icons/profile.png')),
//             label: 'Profile',
//             // backgroundColor: Colors.blue,
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage('files/bottom_navbar_icons/calendar.png')),
//             label: 'Calendar',
//             // backgroundColor: Colors.blue,
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage('files/bottom_navbar_icons/homework.png')),
//             label: 'Homework',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage('files/bottom_navbar_icons/notice.png')),
//             label: 'Notice',
//             // backgroundColor: Colors.blue,
//           ),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
