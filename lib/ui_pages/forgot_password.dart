import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
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
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 20.0),

          Center(
              child: Image(
            height: 150,
            width: 150,
            image: AssetImage('images/excellogo.png'),
            fit: BoxFit.cover,
          )),

          SizedBox(height: 20.0),

          Center(
              child: Text(
            'Forgot Your Password ?',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          )),

          // HeaderContainer(text: "Forgot your Password??"),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // Padding(
                  //   padding: EdgeInsets.only(left: 45, top: 15.0),
                  //   child: Text(
                  //     'E-mail',
                  //     style: TextStyle(
                  //         fontSize: 16.0,
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.black87,
                  //         letterSpacing: 1.0),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0),
                    child:TextFormField(

                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      cursorColor:Colors.black12,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        hoverColor: Colors.black26,
                        focusColor: Colors.black26,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.white),
                        ),

                        isDense: false,
                        hintText: 'Enter your Email',
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'MontserratAlternates',
                          fontStyle: FontStyle.normal,
                          color:Colors.black26,
                        ),
                        suffixIcon: Icon(Icons.mail, size: 20.0, color: Colors.black26),
                      ),

                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Required'),
                        EmailValidator(errorText: 'Not a valid Email'),
                      ]),

                    ),
                  ),
                  SizedBox(height: 50.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword2()));
                    },
                    child: Center(
                      child: Text(
                        'Use Phone Number Instead',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60.0),
                  Center(
                    child: SizedBox(
                      width: 200.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()));
                          } else {
                            return _showToast();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            elevation: 7,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(5)),
                        child: Text(
                          'Verify Email',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
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
