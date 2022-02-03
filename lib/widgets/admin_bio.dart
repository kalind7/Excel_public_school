import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_project_work/utils/color.dart';

class AdminBio extends StatelessWidget {
  String text;
  String bio;
  String jobtitle;
  String answer1;
  String length;
  String answer2;
  String question;
  String answer3;

  AdminBio(
      {required this.text,
      required this.bio,
      required this.jobtitle,
      required this.answer1,
      required this.length,
      required this.answer2,
      required this.question,
      required this.answer3,
      });

  void _showToast() {
    Fluttertoast.showToast(
      msg: 'Contact info : std260@mail.com',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color(0xffef5350),
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [orangeColors, lightRedColors],
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 320.0,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://i.pinimg.com/550x/7d/1a/3f/7d1a3f77eee9f34782c6f88e97a6c888.jpg",
                            ),
                            radius: 50.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            text,
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white,
                            elevation: 5.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 22.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          jobtitle,
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          answer1,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
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
                                            color: Colors.redAccent,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          answer2,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
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
                                            color: Colors.redAccent,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          answer3,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Bio:',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontStyle: FontStyle.normal,
                            fontSize: 28.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        bio,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 200.00,
                child: ElevatedButton(
                  onPressed: () {
                    return _showToast();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                      // side: BorderSide(color: Colors.white),
                      //border width and color
                      elevation: 5,
                      //elevation of button
                      shape: RoundedRectangleBorder(
                        //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                      padding:
                      EdgeInsets.all(15) //content padding inside button
                  ),
                  child: Text(
                    'Contact me',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}