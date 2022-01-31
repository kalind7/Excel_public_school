import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/ui_pages/forgot_password.dart';

// import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/widgets/header_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email;
  late String password;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool checkedValue = false;
  bool newValue = true;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                HeaderContainer(text: 'Login'),
                SizedBox(height: 50.0),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    cursorColor: Color(0xff1b71f1),
                    decoration: InputDecoration(
                      hoverColor: Color(0xff1b71f1),
                      focusColor: Color(0xff1b71f1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      isDense: false,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff1b71f1),
                      ),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Required'),
                      EmailValidator(errorText: 'Not a valid Email'),
                    ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    obscureText: _isObscure,
                    cursorColor: Color(0xff1b71f1),
                    decoration: InputDecoration(
                      hoverColor: Color(0xff1b71f1),
                      focusColor: Color(0xff1b71f1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      isDense: true,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff1b71f1),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 24,
                            color: Color(0xff1b71f1),
                          )),
                    ),
                    autovalidateMode: null,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else if (value.length < 8) {
                        return "Should atleast be 8 characters";
                      } else if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return "Enter strong Password (Hint : abc@123.ab)";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    SizedBox(width: 15),
                    Checkbox(
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue!;
                          });
                        }),
                    Text(
                      'Remember me?',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xff1b71f1),
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
                          color: Color(0xff1b71f1),
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
                      if (formkey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                      }
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Dashboard()));
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
                      style: TextStyle(color: Color(0xff1b71f1), fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
