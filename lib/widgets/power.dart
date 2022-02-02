import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Power extends StatelessWidget {
  const Power({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white,
      title: Center(
          child: Text(
        'LOG OUT!!',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/login');
              },
              child: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
