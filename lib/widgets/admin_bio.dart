import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: WidgetAppbar(title: 'Bio', onPress: (){Navigator.pop(context);}, icon: Icons.arrow_back),
        ),
        body: Container(
              margin: EdgeInsets.only(bottom: 5.0, top: 10),
              height: MediaQuery.of(context).size.height ,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('images/profile.png'),
                    radius: 50.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: redTwo,
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
                                    color: redTwo,
                                    fontSize: 20.0,
                                    fontFamily: 'OpenSans',
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
                                    color: Colors.black54,
                                    fontFamily: 'Roboto',
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
                                    color: redTwo,
                                    fontSize: 20.0,
                                    fontFamily: 'OpenSans',
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
                                    color: Colors.black54,
                                    fontFamily: 'Roboto',
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
                                    color: redTwo,
                                    fontSize: 20.0,
                                    fontFamily: 'OpenSans',
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
                                    color: Colors.black54,
                                    fontFamily: 'Roboto',
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
                    height: MediaQuery.of(context).size.height * 0.03,
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
                              fontFamily: 'OpenSans',
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
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.12,
                      ),
                     Center(
                       child:Button(
                         onPress: () {
                           return _showToast();
                         },
                         text: 'Contact Me', color: orangeOne, shadowColor: orangeTwo,
                       ),
                     ),

                    ],
                  ),
                ],
              ),
            ),

      ),
    );
  }
}
