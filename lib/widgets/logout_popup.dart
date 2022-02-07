import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildPopupDialog extends StatelessWidget {
  const BuildPopupDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white,
      title: Center(
          child: Text(
            'Do you want to LOG OUT ?',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'MontserratAlternates'),
          )),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No',style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'MontserratAlternates')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/login');
              },
              child: Text('Yes',style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'MontserratAlternates')),
            ),
          ),
        ],
      ),
    );
  }
}
