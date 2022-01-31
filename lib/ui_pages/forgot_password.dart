import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/ui_pages/forgot_password2.dart';
import 'package:new_project_work/widgets/header_container.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late String email;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void _showToast() {
    Fluttertoast.showToast(
      msg: 'Your E-mail has been verified',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color(0xffef5350),
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          HeaderContainer(text: "Forgot your Password??"),
           Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
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
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          isDense: false,
                          hintText: 'Enter your E-mail.',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
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
                    SizedBox(height: 100.0),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword2()));
                      },
                      child: Text(
                        'Use Phone Number Instead',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xff1b71f1),
                        ),
                      ),
                    ),
                    SizedBox(height: 60.0),
                    ElevatedButton(
                      onPressed:(){
                        if (formkey.currentState!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                        }else{
                           Text('Use phone number instead') ;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(color: Colors.white),
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding:
                              EdgeInsets.all(20) //content padding inside button
                          ),
                      child: GestureDetector(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            return _showToast();
                          }
                        },
                        child: Text(
                          'Verify E-mail',
                          style:
                              TextStyle(color: Color(0xff1b71f1), fontSize: 16),
                        ),
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
