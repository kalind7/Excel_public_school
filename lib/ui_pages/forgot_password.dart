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
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: <Widget>[

          SizedBox(height: 20.0),

          Center(child:Image(
            height: 100,
            width: 100,
            image: AssetImage('images/excellogo.png'),
            fit: BoxFit.cover,
          )),

          SizedBox(height: 20.0),

          Center(child: Text('Forgot Your Password ?', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Colors.black87),)),

          // HeaderContainer(text: "Forgot your Password??"),
           Container(
             height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.only( left:45, top: 15.0),
                      child: Text('E-mail', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black87, letterSpacing: 1.0),),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 10.0),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        cursorColor: Colors.black87,
                        decoration: InputDecoration(
                          hoverColor: Colors.black87,
                          focusColor: Colors.black87,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: false,
                          suffixIcon: Icon(Icons.email, size: 15.0, color: Colors.black87,),
                          hintText: 'Enter your E-mail.',
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Colors.black87,
                          ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword2()));
                      },
                      child: Center(child:Text(
                        'Use Phone Number Instead',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                        ),
                      ),),
                    ),
                    SizedBox(height: 60.0),
                    Center(
                      child: SizedBox(
                        height: 60.0,
                        width: 250.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                            }else{
                              return _showToast();
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
                            'Verify Email',
                            style: TextStyle(color:Colors.black87, fontSize: 16),
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
