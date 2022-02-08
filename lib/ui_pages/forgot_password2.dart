import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/code_page.dart';
import 'package:new_project_work/ui_pages/forgot_password.dart';

class ForgotPassword2 extends StatefulWidget {
  @override
  _ForgotPassword2State createState() => _ForgotPassword2State();
}

class _ForgotPassword2State extends State<ForgotPassword2> {
  late int number;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0),
                    child:TextFormField(
                      keyboardType: TextInputType.number,

                      onChanged: (value) {
                        setState(() {
                          number = value as int ;
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
                        hintText: 'Enter your number',
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'MontserratAlternates',
                          fontStyle: FontStyle.normal,
                          color:Colors.black26,
                        ),
                        suffixIcon:  Icon(
                          Icons.phone,
                          size: 15.0,
                          color: Colors.black26,
                        ),
                      ),

                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your number";
                        } else if (value.length < 10) {
                          return "Enter valid mobile number";
                        } else if (value.length > 10) {
                          return "Number exceeds 10 digits.";
                        }else{
                          return null;
                        }
                      },

                    ),
                  ),

                  SizedBox(height: 50.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: Center(
                      child: Text(
                        'Use E-mail Instead',
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
                      height: 60.0,
                      width: 250.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CodePage()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            // side: BorderSide(color: Colors.blue),

                            elevation: 7,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.all(20)),
                        child: Text(
                          'Get Code',
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



void main() => runApp(ForgotPassword2());
