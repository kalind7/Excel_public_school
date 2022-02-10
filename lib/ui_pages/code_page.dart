import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
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
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5.0),
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
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  'We sent you a code to verify\n'
                  '       your phone number',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 25.0),
                Text(
                  'Sent to :- 9860052112',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black12,
                      letterSpacing: 1.0),
                ),
                SizedBox(height: 35.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpInput(_fieldOne, true),
                    OtpInput(_fieldTwo, false),
                    OtpInput(_fieldThree, false),
                    OtpInput(_fieldFour, false),
                  ],
                ),
                SizedBox(height: 35.0),
                Text(
                  _otp ?? 'Please enter OTP',
                  style: const TextStyle(fontSize: 30),
                ),
                SizedBox(height: 25.0),
                Text(
                  'I didn\u0027t receive a code!',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black26),
                ),
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
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 70.0),

                SizedBox(
                  width: 200.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/dashboard');
                      },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(5)),
                    child: Text(
                      'Go to Dashboard',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
