import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/widgets/appbar.dart';
import 'package:excel_public_school/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AdminBio extends StatelessWidget {
  final String text;
  final String bio;
  final String jobTitle;
  final String answer1;
  final String length;
  final String answer2;
  final String question;
  final String answer3;

  const AdminBio({Key? key,
    required this.text,
    required this.bio,
    required this.jobTitle,
    required this.answer1,
    required this.length,
    required this.answer2,
    required this.question,
    required this.answer3,
  }) : super(key: key);

  void _showToast() {
    Fluttertoast.showToast(
      msg: 'Contact info : std260@mail.com',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color(0xffef5350),
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55.0),
          child: WidgetAppbar(title: 'Bio', onPress: (){Navigator.pop(context);}, icon: Icons.arrow_back),
        ),
        body: Container(
          margin: const EdgeInsets.only(bottom: 5.0, top: 10),
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const CircleAvatar(
                backgroundImage: AssetImage('images/profile.png'),
                radius: 50.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 22.0,
                  color: orangeOne,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                clipBehavior: Clip.antiAlias,
                color: Colors.white,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              jobTitle,
                              style: TextStyle(
                                color: orangeOne,
                                fontSize: 20.0,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              answer1,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black54,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              length,
                              style: TextStyle(
                                color: orangeOne,
                                fontSize: 20.0,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              answer2,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black54,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              question,
                              style: TextStyle(
                                color: orangeOne,
                                fontSize: 20.0,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              answer3,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black54,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Bio:',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'OpenSans',
                          fontSize: 28.0),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:Text(
                      bio,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                  ),
                  Center(
                    child:Button(
                      onPress: () {
                        return _showToast();
                      },
                      text: 'Contact Me', color: orangeOne, shadowColor: orangeOne,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}