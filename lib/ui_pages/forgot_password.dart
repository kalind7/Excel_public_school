import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/forgot_password2.dart';
import 'package:new_project_work/widgets/header_container.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


   void _showToast(){
    Fluttertoast.showToast(
      msg: 'Your E-mail has been verified',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color(0xffef5350),
      textColor: Color(0xffF5591F),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          HeaderContainer(text: "Forgot your Password??"),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: TextField(
                      cursorColor: Color(0xffF5591F),
                      decoration: InputDecoration(
                        hoverColor: Color(0xffF5591F),
                        focusColor: Color(0xffF5591F),
                        disabledBorder: InputBorder.none,
                        isDense: false,
                        hintText: 'Enter your E-mail.',
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color:Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100.0),

                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          PageRouteBuilder(
                              transitionDuration: Duration(
                                  seconds: 1),
                              transitionsBuilder: (
                                  context, animation,
                                  animationTime, child) {
                                //  animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
                                return ScaleTransition(
                                  alignment: Alignment
                                      .center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (context,
                                  animation,
                                  animationTime) {
                                return ForgotPassword2();
                              }
                          ));
                    },
                    child: Text(
                      'Use Phone Number Instead',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xffF5591F),
                      ),
                    ),
                  ),



                  SizedBox(height: 100.0),

                  ElevatedButton(
                    onPressed: _showToast,
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: BorderSide(color: Colors.white),
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.all(20) //content padding inside button
                        ),
                    child: Text(
                      'Verify E-mail',
                      style:
                          TextStyle(color: Color(0xffF5591F), fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(ForgotPassword());

