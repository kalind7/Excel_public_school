import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/ui_pages/forgot_password2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_project_work/widgets/elevated_button.dart';
import 'package:new_project_work/widgets/footer.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late String email;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void _showToast() {
    Fluttertoast.showToast(
      msg: 'Your E-mail has not been verified',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color(0xffef5350),
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:ListView(
          // shrinkWrap: true,
          // scrollDirection: Axis.vertical,
          // physics: ClampingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      height: 125,
                      width: 150,
                      image: AssetImage('images/excellogo.png'),
                      fit: BoxFit.cover,
                    ),
                    Center(
                        child: Text(
                          'Forgot Your Password ?',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'Roboto',
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        cursorColor: Colors.black12,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
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
                            fontFamily: 'OpenSans',
                            fontStyle: FontStyle.normal,
                            color: Colors.black26,
                          ),
                          suffixIcon:
                          Icon(Icons.mail, size: 20.0, color: Colors.black26),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Required'),
                          EmailValidator(errorText: 'Not a valid Email'),
                        ]),
                      ),
                    ),
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
                            fontSize: 18.0,
                            color: Colors.blue,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    Button(
                        text: 'Verify Email',
                        onPress: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()));
                          } else {
                            return _showToast();
                          }
                        }),

                    Footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(ForgotPassword());
