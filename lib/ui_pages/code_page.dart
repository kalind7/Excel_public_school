import 'package:flutter/material.dart';

import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/elevated_button.dart';
import 'package:new_project_work/widgets/get_otp.dart';

class CodePage extends StatefulWidget {
  const CodePage({Key? key}) : super(key: key);

  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
   final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            size: 20.0,
                            color: Colors.black26,
                          )),
                      Text(
                        'VERIFY PHONE',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black26,
                            fontFamily: 'Roboto',
                            letterSpacing: 1.0),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _otp = _fieldOne.text +
                                _fieldTwo.text +
                                _fieldThree.text +
                                _fieldFour.text;
                          });
                        },
                        child: Center(
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Roboto',
                              color: redOne,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Text(
                        'We sent you a code to verify\n'
                            '       your phone number',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'OpenSans',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Sent to :- 9860052112',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            color: Colors.black12,
                            letterSpacing: 1.0),
                      ),
                    ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpInput(_fieldOne, true),
                      OtpInput(_fieldTwo, false),
                      OtpInput(_fieldThree, false),
                      OtpInput(_fieldFour, false),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        _otp ?? 'Please enter OTP',
                        style: const TextStyle(fontSize: 30,fontFamily: 'Roboto',),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'I didn\u0027t receive a code!',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSans',
                            color: Colors.black26),
                      ),
                      SizedBox(height: 10.0),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _otp = null;
                          });
                        },
                        child: Center(
                          child: Text(
                            'Resend',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: redOne,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                        child: Button(text: 'Go to Dashboard',onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
                  }, color: orangeOne, shadowColor: orangeTwo,),
                  ),


                ],
              ),
            ),


      ),
    );
  }
}
