import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
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
      body:  SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child:SafeArea(
          child: Form(
            key: formkey,
            child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [


                  SizedBox(height: 15.0),

                  Center(child:Image(
                    height: 100,
                    width: 100,
                    image: AssetImage('images/excellogo.png'),
                    fit: BoxFit.cover,
                  )),

                  Padding(
                    padding: EdgeInsets.only(left: 45, top: 15.0),
                    child: Text('E-mail', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black87, letterSpacing: 1.0),),
                  ),



                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40, top: 10.0),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      cursorColor:Colors.black87,
                      decoration: InputDecoration(
                        hoverColor: Colors.black87,
                        focusColor: Colors.black87,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: Icon(Icons.email, size: 15.0, color: Colors.black87,),
                        isDense: false,
                        hintText: 'Enter your E-mail',
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color:Colors.black87,
                        ),
                      ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Required'),
                        EmailValidator(errorText: 'Not a valid Email'),
                      ]),
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(left: 45, top: 10.0),
                    child: Text('Password', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black87, letterSpacing: 1.0),),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: _isObscure,
                      cursorColor: Colors.black87,
                      decoration: InputDecoration(
                        hoverColor: Colors.black87,
                        focusColor: Colors.black87,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        isDense: true,
                        hintText: 'Enter your Password',
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color:Colors.black87,
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
                              color: Colors.black87,
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
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Checkbox(
                          checkColor: Colors.black,
                          activeColor: Colors.blue,
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue!;
                            });
                          }),
                      Text(
                        'Remember me?',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color:Colors.black87,
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
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color:Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: SizedBox(
                      height: 60.0,
                      width: 250.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            // side: BorderSide(color: Colors.blue),

                            elevation: 7,

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(20)
                        ),
                        child: Text(
                          'Log In',
                          style: TextStyle(color:Colors.black87, fontSize: 16),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),

                  Center(child:Text('     -OR- \n'
                      'Sign in with,',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black87),),),

                  SizedBox(
                    height: 20.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     GestureDetector(
                       onTap: (){
                         print('Google');
                       },
                       child: CircleAvatar(
                         backgroundColor: Colors.white,
                         backgroundImage: AssetImage('images/google.png'),
                       ),
                     ),

                      GestureDetector(
                        onTap: (){
                          print('facebook');
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('images/facebook.png'),
                        ),
                      ),
                    ],
                  ),

                ],

            ),
          ),
        ),
      ),

    );
  }
}
