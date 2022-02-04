import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_project_work/widgets/admin_bio.dart';

class StudentWork extends StatefulWidget {
  const StudentWork({Key? key}) : super(key: key);

  @override
  _StudentWorkState createState() => _StudentWorkState();
}

class _StudentWorkState extends State<StudentWork> {
  bool checkedValue = false;
  bool newValue = true;

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white,
      title: Center(
          child: Text(
        'Not Found!!',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Text(
              'In Maintainence',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: HexColor("#7459DC"),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 30),
            child: Row(
              children: [
                Checkbox(
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue!;
                      });
                    }),
                Flexible(
                  child: Text(
                    'Agreed ??',
                    overflow: TextOverflow.fade,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: HexColor('#9C9C9C'),
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, left: 20.0),
          child: Text(
            'Student Needs',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          ),
        ),
        Column(
          children: [
            Container(
              height: 250.0,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrangeAccent.withOpacity(.05),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(4, 3), // changes position of shadow
                    ),
                  ]),

              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    // width: 100.0,
                    // height: 90.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: HexColor("#F4F4F4")),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepOrangeAccent.withOpacity(.08),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(4, 3), // changes position of shadow
                          ),
                        ]),

                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: IconButton(
                                onPressed: () {},
                                iconSize: 70.0,
                                icon: Image.asset(
                                  'images/profile.png',
                                )),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Student Profile',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, top: 10.0),
                            child: Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildPopupDialog(context),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          HexColor("#04212D"), // background
                                    ),
                                    child: Text('Click Here',
                                        style: TextStyle(color: Colors.white))),
                                IconButton(
                                  onPressed: () {
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
                                                )));
                                  },
                                  color: Colors.black,
                                  iconSize: 20.0,
                                  icon: Icon(Icons.arrow_forward),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    // width: 100.0,
                    // height: 90.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: HexColor("#F4F4F4")),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepOrangeAccent.withOpacity(.08),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(4, 3), // changes position of shadow
                          ),
                        ]),

                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: IconButton(
                                onPressed: () {},
                                iconSize: 70.0,
                                icon: Image.asset(
                                  'images/fees.webp',
                                )),
                            // child: Image(
                            //   fit: BoxFit.cover,
                            //   width: 100.0,
                            //   image: AssetImage('images/excellogo.png'),
                            // ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'FEES',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Total Fee: \$ 200',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, top: 10.0),
                            child: Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildPopupDialog(context),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          HexColor("#04212D"), // background
                                    ),
                                    child: Text('Click Here',
                                        style: TextStyle(color: Colors.white))),
                                IconButton(
                                  onPressed: () {
                                    // Navigator.push(context,
                                    // PageRouteBuilder(
                                    //     transitionDuration: Duration(
                                    //         seconds: 1),
                                    //     transitionsBuilder: (context,
                                    //         animation, animationTime,
                                    //         child) {
                                    //       //  animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
                                    //       return ScaleTransition(
                                    //         alignment: Alignment.center,
                                    //         scale: animation,
                                    //         child: child,
                                    //       );
                                    //     },
                                    //     pageBuilder: (context,
                                    //         animation, animationTime) {
                                    //       return AdminBio();
                                    //     }
                                    // ));
                                  },
                                  color: Colors.black,
                                  iconSize: 20.0,
                                  icon: Icon(Icons.arrow_forward),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    // width: 100.0,
                    // height: 90.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: HexColor("#F4F4F4")),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepOrangeAccent.withOpacity(.08),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(4, 3), // changes position of shadow
                          ),
                        ]),

                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: IconButton(
                                onPressed: () {},
                                iconSize: 70.0,
                                icon: Image.asset(
                                  'images/result.jpg',
                                )),
                            // child: Image(
                            //   fit: BoxFit.cover,
                            //   width: 100.0,
                            //   image: AssetImage('images/excellogo.png'),
                            // ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'RESULT',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Results of First Terminal',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, top: 10.0),
                            child: Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildPopupDialog(context),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          HexColor("#04212D"), // background
                                    ),
                                    child: Text('Click Here',
                                        style: TextStyle(color: Colors.white))),
                                IconButton(
                                  onPressed: () {
                                    // Navigator.push(context,
                                    //     PageRouteBuilder(
                                    //         transitionDuration: Duration(
                                    //             seconds: 1),
                                    //         transitionsBuilder: (context,
                                    //             animation, animationTime,
                                    //             child) {
                                    //           //  animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
                                    //           return ScaleTransition(
                                    //             alignment: Alignment.center,
                                    //             scale: animation,
                                    //             child: child,
                                    //           );
                                    //         },
                                    //         pageBuilder: (context,
                                    //             animation, animationTime) {
                                    //           return AdminBio();
                                    //         }
                                    //     ));
                                  },
                                  color: Colors.black,
                                  iconSize: 20.0,
                                  icon: Icon(Icons.arrow_forward),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    // width: 100.0,
                    // height: 90.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: HexColor("#F4F4F4")),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepOrangeAccent.withOpacity(.08),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(4, 3), // changes position of shadow
                          ),
                        ]),

                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: IconButton(
                                onPressed: () {},
                                iconSize: 70.0,
                                icon: Image.asset(
                                  'images/routine.png',
                                )),
                            // child: Image(
                            //   fit: BoxFit.cover,
                            //   width: 100.0,
                            //   image: AssetImage('images/excellogo.png'),
                            // ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Routine',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'See Routine',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, top: 10.0),
                            child: Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildPopupDialog(context),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          HexColor("#04212D"), // background
                                    ),
                                    child: Text('Click Here',
                                        style: TextStyle(color: Colors.white))),
                                IconButton(
                                  onPressed: () {
                                    // Navigator.push(context,
                                    //     PageRouteBuilder(
                                    //         transitionDuration: Duration(
                                    //             seconds: 1),
                                    //         transitionsBuilder: (context,
                                    //             animation, animationTime,
                                    //             child) {
                                    //           //  animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
                                    //           return ScaleTransition(
                                    //             alignment: Alignment.center,
                                    //             scale: animation,
                                    //             child: child,
                                    //           );
                                    //         },
                                    //         pageBuilder: (context,
                                    //             animation, animationTime) {
                                    //           return AdminBio();
                                    //         }
                                    //     ));
                                  },
                                  color: Colors.black,
                                  iconSize: 20.0,
                                  icon: Icon(Icons.arrow_forward),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    // width: 100.0,
                    // height: 90.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: HexColor("#F4F4F4")),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepOrangeAccent.withOpacity(.08),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(4, 3), // changes position of shadow
                          ),
                        ]),

                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: IconButton(
                                onPressed: () {},
                                iconSize: 70.0,
                                icon: Image.asset(
                                  'images/subject.png',
                                )),
                            // child: Image(
                            //   fit: BoxFit.cover,
                            //   width: 100.0,
                            //   image: AssetImage('images/excellogo.png'),
                            // ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'SUBJECT',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Total Subjects: 10',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, top: 10.0),
                            child: Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildPopupDialog(context),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          HexColor("#04212D"), // background
                                    ),
                                    child: Text('Click Here',
                                        style: TextStyle(color: Colors.white))),
                                IconButton(
                                  onPressed: () {},
                                  color: Colors.black,
                                  iconSize: 20.0,
                                  icon: Icon(Icons.arrow_forward),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    // width: 100.0,
                    // height: 90.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: HexColor("#F4F4F4")),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepOrangeAccent.withOpacity(.08),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(4, 3), // changes position of shadow
                          ),
                        ]),

                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: IconButton(
                                onPressed: () {},
                                iconSize: 70.0,
                                icon: Image.asset(
                                  'images/downloads.webp',
                                )),
                            // child: Image(
                            //   fit: BoxFit.cover,
                            //   width: 100.0,
                            //   image: AssetImage('images/excellogo.png'),
                            // ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'DOWNLOAD',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Download necessary courses',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, top: 10.0),
                            child: Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildPopupDialog(context),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          HexColor("#04212D"), // background
                                    ),
                                    child: Text('Click Here',
                                        style: TextStyle(color: Colors.white))),
                                IconButton(
                                  onPressed: () {
                                    // Navigator.push(context,
                                    //     PageRouteBuilder(
                                    //         transitionDuration: Duration(
                                    //             seconds: 1),
                                    //         transitionsBuilder: (context,
                                    //             animation, animationTime,
                                    //             child) {
                                    //           //  animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
                                    //           return ScaleTransition(
                                    //             alignment: Alignment.center,
                                    //             scale: animation,
                                    //             child: child,
                                    //           );
                                    //         },
                                    //         pageBuilder: (context,
                                    //             animation, animationTime) {
                                    //           return AdminBio();
                                    //         }
                                    //     ));
                                  },
                                  color: Colors.black,
                                  iconSize: 20.0,
                                  icon: Icon(Icons.arrow_forward),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
