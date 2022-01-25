import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/ui_pages/forgot_password.dart';
import 'package:new_project_work/ui_pages/forgot_password2.dart';
import 'package:new_project_work/widgets/header_container.dart';

class ForgotPassword2 extends StatefulWidget {
  @override
  _ForgotPassword2State createState() => _ForgotPassword2State();
}

class _ForgotPassword2State extends State<ForgotPassword2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          HeaderContainer(text: "Forgot Password"),
          Expanded(
            flex: 3,
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
                        hintText: 'Enter your Phone Number.',
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color:Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // _textInput(hint: "Phone Number", icon: Icons.phone),
                  // _textInput(hint: "New Password", icon: Icons.visibility),

                  SizedBox(height: 100.0),

                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Use E-mail Instead',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xffF5591F),
                      ),
                    ),
                  ),



                  SizedBox(height: 100.0),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dashboard()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: BorderSide(color: Colors.white),
                        //border width and color
                        elevation: 7,
                        //elevation of button
                        shape: RoundedRectangleBorder(
                          //to set border radius to button
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                        EdgeInsets.all(20) //content padding inside button
                    ),
                    child: Text(
                      'Get Code',
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
