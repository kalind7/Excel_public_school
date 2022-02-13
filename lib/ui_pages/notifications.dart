import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewNotification extends StatefulWidget {
  const NewNotification({Key? key}) : super(key: key);

  @override
  _NewNotificationState createState() => _NewNotificationState();
}

class _NewNotificationState extends State<NewNotification> {
  bool isSwitched = false;
  bool onSwitched = true;
  bool onSwitch = false;
  bool isSwitch = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black,),
          ),
          title: Text('Notification',style: TextStyle(fontFamily: 'OpenSans',color: Colors.black),),
          backgroundColor: Colors.grey.shade200,
          shadowColor: Colors.transparent,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SizedBox(height: 10.0),

            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  child: Icon(Icons.file_copy_sharp, size: 18.0,)
              ),
              title: Text('News For You',style: TextStyle(fontSize: 18.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),

              trailing: Switch(value: isSwitched, onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },),
            ),

            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                  child: Icon(Icons.person, size: 18.0,)
              ),
              title: Text('Account Activity',style: TextStyle(fontSize: 18.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),

              trailing: Switch(value: isSwitch, onChanged: (value) {
                setState(() {
                  isSwitch = value;
                });
              },),
            ),

            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                  child: Icon(Icons.library_books, size: 18.0,)
              ),
              title: Text('Notices',style: TextStyle(fontSize: 18.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),

              trailing: Switch(value: onSwitched, onChanged: (value) {
                setState(() {
                  onSwitched = value;
                });
              },),
            ),

            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.update, size: 18.0,)
              ),
              title: Text('App Updates',style: TextStyle(fontSize: 18.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),

              trailing: Switch(value: onSwitch, onChanged: (value) {
                setState(() {
                  onSwitch = value;
                });
              },),
            ),
          ],
        ),
      ),
    );
  }
}

