import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';

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

          SizedBox(height: 20.0),

          Center(child:Image(
            height: 100,
            width: 100,
            image: AssetImage('images/excellogo.png'),
            fit: BoxFit.cover,
          )),

          SizedBox(height: 20.0),

          Center(child: Text('Forgot Your Password ?', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Colors.black87),)),

          // HeaderContainer(text: "Forgot Password"),
           Container(
             height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only( left:45, top: 15.0),
                    child: Text('Mobile Number', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black87, letterSpacing: 1.0),),
                  ),

                  Form(
                    key: formkey,
                    child:Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 10.0),
                      child: TextFormField(
                        onChanged: (value){
                          setState(() {
                            number = value as int;
                          });
                        },
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black87,
                        decoration: InputDecoration(
                          hoverColor:Colors.black87,
                          focusColor: Colors.black87,
                          disabledBorder: InputBorder.none,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: false,
                          suffixIcon: Icon(Icons.phone, size: 15.0, color: Colors.black87,),
                          hintText: 'Enter your Number.',
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color:Colors.black87,
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

                  SizedBox(height: 50.0),

                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child:Text(
                        'Use E-mail Instead',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),



                  SizedBox(height: 40.0),

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
                          'Get Code',
                          style: TextStyle(color:Colors.black87, fontSize: 16),
                        ),
                      ),
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

