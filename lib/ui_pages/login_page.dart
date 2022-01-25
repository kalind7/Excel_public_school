import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project_work/ui_pages/forgot_password.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/widgets/header_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checkedValue = false;
  bool newValue = true;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              HeaderContainer(text: 'Login'),
              SizedBox(height: 100.0),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    hoverColor: Color(0xffF5591F),
                    focusColor: Color(0xffF5591F),
                    disabledBorder: InputBorder.none,
                    isDense: false,
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Color(0xffF5591F),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20, left: 50, right: 50),
                child: TextField(
                  obscureText: _isObscure,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    hoverColor: Color(0xffF5591F),
                    focusColor: Color(0xffF5591F),
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    isDense: false,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Color(0xffF5591F),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          size: 24,
                          color: Color(0xffF5591F),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(width: 25),
                  Checkbox(
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue!;
                        });
                      }),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.check_box_outline_blank),
                  //   iconSize: 24.0,
                  //   color: Colors.grey,
                  // ),
                  Text(
                    'Remember me?',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xffF5591F),
                    ),
                  ),
                  SizedBox(
                    width: 45.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xffF5591F),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 60.0,
                width: 180.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
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
                    'Log In',
                    style: TextStyle(color: Color(0xffF5591F), fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
