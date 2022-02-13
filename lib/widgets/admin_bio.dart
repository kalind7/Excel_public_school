import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_project_work/widgets/elevated_button.dart';
import 'package:new_project_work/widgets/logout_popup.dart';

class AdminBio extends StatelessWidget {
  final String text;
  final String bio;
  final String jobtitle;
  final String answer1;
  final String length;
  final String answer2;
  final String question;
  final String answer3;

  AdminBio({
    required this.text,
    required this.bio,
    required this.jobtitle,
    required this.answer1,
    required this.length,
    required this.answer2,
    required this.question,
    required this.answer3,
  });

  void _showToast() {
    Fluttertoast.showToast(
      msg: 'Contact info : std260@mail.com',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color(0xffef5350),
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, size: 24.0, color: Colors.black),
          ),
          title: Text('Bio',
              style: TextStyle(color: Colors.black, fontFamily: 'OpenSans')),
          centerTitle: true,
          backgroundColor: Colors.green.shade300,
          shadowColor: Colors.transparent,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 3.0, top: 2.0),
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => BuildPopupDialog(),
                  );
                },
                icon: Icon(Icons.logout, size: 24.0, color: Colors.black),
              ),
            ),
          ],
        ),
        body: ListView(
          // shrinkWrap: true,
          // scrollDirection: Axis.vertical,
          // physics: ClampingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15.0, top: 10),
              height: MediaQuery.of(context).size.height / 1.15,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://i.pinimg.com/550x/7d/1a/3f/7d1a3f77eee9f34782c6f88e97a6c888.jpg",
                    ),
                    radius: 50.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black87,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  jobtitle,
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 20.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  answer1,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  length,
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 20.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  answer2,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  question,
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 20.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  answer3,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Bio:',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Roboto',
                              fontSize: 28.0),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child:Text(
                            bio,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'OpenSans',
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.14,
                      ),
                     Center(
                       child:Button(
                         onPress: () {
                           return _showToast();
                         },
                         text: 'Contact Me',
                       ),
                     ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
