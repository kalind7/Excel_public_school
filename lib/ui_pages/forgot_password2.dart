import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/ui_pages/login_page.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/btn_widget.dart';
import 'package:new_project_work/widgets/header_container.dart';

class ForgotPassword2 extends StatefulWidget {
  @override
  _ForgotPassword2State createState() => _ForgotPassword2State();
}

class _ForgotPassword2State extends State<ForgotPassword2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
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
                    // _textInput(hint: "Phone Number", icon: Icons.phone),
                    // _textInput(hint: "New Password", icon: Icons.visibility),

                    SizedBox(height: 100.0),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword2()));
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
      ),
    );
  }
//
// Widget _textInput({controller, hint, icon}) {
//   return Container(
//     margin: EdgeInsets.only(top: 10),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.all(Radius.circular(20)),
//       color: Colors.white,
//     ),
//     padding: EdgeInsets.only(left: 10),
//     child: TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         hintText: hint,
//         suffixIcon: Icon(icon),
//       ),
//     ),
//   );
// }
}
