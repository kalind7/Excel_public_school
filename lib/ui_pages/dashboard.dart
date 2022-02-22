
// import 'package:flutter/material.dart';

// import 'package:new_project_work/utils/color.dart';

// import 'package:new_project_work/widgets/appbar.dart';

// import 'package:new_project_work/widgets/category_drawer.dart';
// import 'package:new_project_work/widgets/grid_view.dart';


// class Dashboard extends StatefulWidget {
//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         extendBodyBehindAppBar: true,
//         key: _scaffoldKey,
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(55.0),
//           child: WidgetAppbar(
//             title: '',
//             onPress: () => _scaffoldKey.currentState!.openDrawer(),
//             icon: Icons.menu,
//           ),
//         ),
//         drawer: CategoryDrawer(),
//         body: Stack(
//           // clipBehavior: Clip.hardEdge,
//           // overflow: Overflow.clip,
//           children: <Widget>[
//             Column(
//               children: <Widget>[
//                 Container(
//                   height: 155.0,
//                   // child: Center(
//                   //   child: CircleAvatar(
//                   //     backgroundColor: Colors.green,
//                   //     radius: 70.0,
//                   //   ),
//                   // ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(18),
//                         bottomRight: Radius.circular(18)),
//                     gradient: LinearGradient(
//                         colors: [pink, orange],
//                         end: Alignment.bottomCenter,
//                         begin: Alignment.topCenter),
//                   ),
//                 ),
//                 Gridview(),
//               ],
//             ),
//             Positioned(
//               left: 10,
//               right: 10,
//               top: 120,
//               // alignment: Alignment.center,
//               child: Card(
//                 shadowColor: pink,
//                 clipBehavior: Clip.antiAlias,
//                 elevation: 15.0,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     side: BorderSide(width: 1, color: pink)),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width - 80,
//                   height: 60,
//                   child: Center(
//                       child: Padding(
//                     padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
//                     child: Text(
//                       "Dhiraj Shrestha",
//                       style: TextStyle(
//                           fontSize: 20.0,
//                           color: pink,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   )),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 20,
//               right: 20,
//               top: 35,
//               // alignment: Alignment.center,
//               child: Container(
//                 padding: const EdgeInsets.all(4.0),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [pink, orange],
//                       end: Alignment.bottomCenter,
//                       begin: Alignment.topCenter),
//                   shape: BoxShape.circle,
//                 ),
//                 child: CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 55.0,
//                   child: Image(
//                     image: AssetImage('images/excellogo.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 100.0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
