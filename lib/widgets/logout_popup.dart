import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:new_project_work/api/api_url.dart';
import 'package:new_project_work/route/router_constant.dart';

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
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'OpenSans',
            color: Colors.black87),
      )),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.green.shade200,
                  primary: Colors.green.shade200,
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(5)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'OpenSans',
                    color: Colors.black87,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.green.shade200,
                  primary: Colors.green.shade200,
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(5)),
              onPressed: () {
                logout();
              },
              child: Text('Yes',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'OpenSans',
                      color: Colors.black87)),
            ),
          ),
        ],
      ),
    );
  }

  logout() async {
    var box = await Hive.openBox(Constants.APPNAME);
    box.clear();
    Get.offNamed(loginRoute);
  }
}
