import 'package:excel_public_school/ui_pages/dashboard.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/widgets/category_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminBio extends StatelessWidget {
  AdminBio({
    Key? key,
  }) : super(key: key);

  void _showToast() {
    Fluttertoast.showToast(
      msg: 'Contact info : std260@mail.com',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color(0xffef5350),
      textColor: Colors.white,
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const CategoryDrawer(),
        body: ListView(
          children: [
             Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [pinkOne, orangeOne, orangeOne],
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0))),
                    child: ListView(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              icon: SvgPicture.asset(
                                  'files/icons/four_bar_menu.svg'),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            const Center(child: Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text('Student Details',style: TextStyle(fontSize: 24.0, fontFamily: 'Roboto', fontWeight: FontWeight.w500, color: Colors.white),),
                            )),

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),

                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset('files/icons/search.svg'),
                            ),

                            PopupMenuButton<int>(
                              icon: SvgPicture.asset('files/icons/menu.svg'),
                              color: Colors.white,
                              itemBuilder: (context) => [
                                const PopupMenuItem<int>(
                                  value: 0,
                                  child: Text(
                                    'Setting',
                                    style: drawerTitle,
                                  ),
                                ),
                                const PopupMenuItem<int>(
                                  value: 1,
                                  child: Text(
                                    'Privacy Policy Page',
                                    style: drawerTitle,
                                  ),
                                ),
                                const PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 2,
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.logout,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        "Logout",
                                        style: drawerTitle,
                                      ),
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
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 50, 15, 0),
                          child: CircleAvatar(
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
                          margin: const EdgeInsets.only(
                              top: 140.0, left: 20, right: 20),
                          height: MediaQuery.of(context).size.height * 0.125,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(width: 1, color: orangeOne),
                            boxShadow: [
                              BoxShadow(
                                color: orangeOne.withOpacity(0.3),
                                spreadRadius: 10,
                                blurRadius: 5,
                                offset: const Offset(0,0),
                              ),
                            ],
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Ram Bahadur Aryal',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  color: pinkOne),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),


            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 15.0,),
            //   height: MediaQuery.of(context).size.height /2.5,
            //   decoration: BoxDecoration(
            //     border: Border(
            //       bottom: BorderSide(color: orangeOne, width: 5)
            //     ),
            //     borderRadius: BorderRadius.circular(10.0),
            //     color: Colors.grey,
            //   ),
            //   child: Column(
            //     children: [
            //
            //     ],
            //   ),
            // ),



          ],
        ),
      ),
    );
  }
}
