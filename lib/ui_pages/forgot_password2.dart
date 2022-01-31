import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/widgets/header_container.dart';

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
        scrollDirection: Axis.vertical,
        children: <Widget>[
          HeaderContainer(text: "Forgot Password"),
           Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[

                  Form(
                    key: formkey,
                    child:Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        onChanged: (value){
                          setState(() {
                            number = value as int;
                          });
                        },
                        keyboardType: TextInputType.number,
                        cursorColor: Color(0xff1b71f1),
                        decoration: InputDecoration(
                          hoverColor: Color(0xff1b71f1),
                          focusColor: Color(0xff1b71f1),
                          disabledBorder: InputBorder.none,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          isDense: false,
                          hintText: 'Enter your Phone Number.',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color:Color(0xff1b71f1),
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter your number";
                          }else if(value.length<10){
                            return "Enter valid mobile number";
                          }else{
                            return null;
                          }
                        },
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
                        color: Color(0xff1b71f1),
                      ),
                    ),
                  ),



                  SizedBox(height: 70.0),

                  ElevatedButton(
                    onPressed: () {

                      if(formkey.currentState!.validate()){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
                      }
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
                      TextStyle(color: Color(0xff1b71f1), fontSize: 16),
                    ),
                  ),

                ],
              ),
            ),
        ],
      ),
    );
  }
}
void main() => runApp(ForgotPassword2());

