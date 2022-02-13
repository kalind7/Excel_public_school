import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/account_settings.dart';
import 'package:new_project_work/ui_pages/notifications.dart';
import 'package:new_project_work/widgets/logout_popup.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
           Center(child:  Padding(
             padding: EdgeInsets.only(top: 20,bottom: 20.0),
             child: Text('Settings',style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: 'OpenSans',), ),
           ),),

            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              title: Text('Kalind Koirala',style: TextStyle(fontSize: 18.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
              subtitle: Text('+977-9860052311',style: TextStyle(fontSize: 14.0, color: Colors.black38, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
              trailing: IconButton(
                onPressed: (){},
                icon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black87, size: 16.0,),
              ),
            ),

            SizedBox(height: 10.0),

            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                  backgroundColor: Colors.purple,

                  child: Icon(Icons.dark_mode, size: 18.0,)
              ),
              title: Text('Dark Mode',style: TextStyle(fontSize: 18.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),

              trailing: Switch(value: isSwitched, onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },),
            ),

            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child:  Divider(
                height: 1.0,
                thickness: 1.0,
              ),
            ),

            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Padding(
                   padding: EdgeInsets.only(left: 15.0,top: 20.0),
                   child:  Text('GENERAL',  style: TextStyle(fontSize: 16.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                 ),
                  SizedBox(height: 10.0),

                  ListTile(
                    onTap: (){},
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,

                      child: Icon(Icons.person, size: 18.0,),
                    ),
                    title: Text('Account Settings',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                    subtitle: Text('Privacy, Security, Language',style: TextStyle(fontSize: 12.0, color: Colors.black38, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                    trailing: IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettings()));
                      },
                      icon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black87, size: 16.0,),
                    ),
                  ),

                  ListTile(
                    onTap: (){},
                    leading: CircleAvatar(
                      backgroundColor: Colors.orangeAccent,
                      child: Icon(Icons.notifications, size: 18.0,),
                    ),
                    title: Text('Notifications',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                    subtitle: Text('Newsletter, App Updates',style: TextStyle(fontSize: 12.0, color: Colors.black38, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                    trailing: IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewNotification()));
                      },
                      icon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black87, size: 16.0,),
                    ),
                  ),

                  ListTile(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => BuildPopupDialog(),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      child: Icon(Icons.logout, size: 18.0,),
                    ),
                    title: Text('Logout',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                  ),

                  ListTile(
                    onTap: (){},
                    leading: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.delete, size: 18.0,),
                    ),
                    title: Text('Delete Account',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child:  Divider(
                      height: 1.0,
                      thickness: 1.0,
                    ),
                  ),

                ],
              ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0,top: 20.0),
                  child:  Text('FEEDBACK',  style: TextStyle(fontSize: 16.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 10.0),

                ListTile(
                  onTap: (){},
                  leading: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    child: Icon(Icons.bug_report, size: 18.0,),
                  ),
                  title: Text('Report a Bug',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                ),

                ListTile(
                  onTap: (){},
                  leading: CircleAvatar(
                    backgroundColor: Colors.purpleAccent,
                    child: Icon(Icons.thumb_up_sharp, size: 18.0,),
                  ),
                  title: Text('Send Feedback',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                ),



              ],
            ),

          ],
        ),
      ),
    );
  }
}
