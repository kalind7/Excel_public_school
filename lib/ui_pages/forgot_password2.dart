import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/code_page.dart';
import 'package:new_project_work/ui_pages/forgot_password.dart';
import 'package:new_project_work/widgets/elevated_button.dart';
import 'package:new_project_work/widgets/footer.dart';

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
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: formkey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
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
                    fontFamily: 'Mukta',
                  ),
                ),),
                Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        number = value as int;
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
                      hintText: 'Enter your number',
                      hintStyle: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'OpenSans',
                        fontStyle: FontStyle.normal,
                        color: Colors.black26,
                      ),
                      suffixIcon: Icon(
                        Icons.phone,
                        size: 20.0,
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
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
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
                        fontSize: 15.0,
                        color: Colors.blue,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                Button(
                  color: Colors.green.shade200,
                  shadowColor: Colors.green,
                  text: 'Get Code',
                  onPress: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CodePage()));
                    }
                  },
                ),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(ForgotPassword2());
