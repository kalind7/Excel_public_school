import 'package:excel_public_school/ui_pages/account_settings.dart';
import 'package:excel_public_school/ui_pages/notification.dart';
import 'package:excel_public_school/widgets/logout_popup.dart';
import 'package:flutter/material.dart';


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
            const Center(child:  Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20.0),
              child: Text('Settings',style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: 'OpenSans',), ),
            ),),

            ListTile(
              onTap: (){},
              leading: const CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              title: const Text('Kalind Koirala',style: TextStyle(fontSize: 18.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
              subtitle: const Text('+977-9860052311',style: TextStyle(fontSize: 14.0, color: Colors.black38, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
              trailing: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black87, size: 16.0,),
              ),
            ),

            const SizedBox(height: 10.0),

            ListTile(
              onTap: (){},
              leading: const CircleAvatar(
                  backgroundColor: Colors.purple,

                  child: Icon(Icons.dark_mode, size: 18.0,)
              ),
              title: const Text('Dark Mode',style: TextStyle(fontSize: 18.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),

              trailing: Switch(value: isSwitched, onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child:  Divider(
                height: 1.0,
                thickness: 1.0,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15.0,top: 20.0),
                  child:  Text('GENERAL',  style: TextStyle(fontSize: 16.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                ),
                const SizedBox(height: 10.0),

                ListTile(
                  onTap: (){},
                  leading: const CircleAvatar(
                    backgroundColor: Colors.green,

                    child: Icon(Icons.person, size: 18.0,),
                  ),
                  title: const Text('Account Settings',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                  subtitle: const Text('Privacy, Security, Language',style: TextStyle(fontSize: 12.0, color: Colors.black38, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                  trailing: IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black87, size: 16.0,),
                  ),
                ),

                ListTile(
                  onTap: (){},
                  leading: const CircleAvatar(
                    backgroundColor: Colors.orangeAccent,
                    child: Icon(Icons.notifications, size: 18.0,),
                  ),
                  title: const Text('Notifications',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                  subtitle: const Text('Newsletter, App Updates',style: TextStyle(fontSize: 12.0, color: Colors.black38, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                  trailing: IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const NewNotification()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black87, size: 16.0,),
                  ),
                ),

                ListTile(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const BuildPopupDialog(),
                    );
                  },
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.logout, size: 18.0,),
                  ),
                  title: const Text('Logout',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                ),

                ListTile(
                  onTap: (){},
                  leading: const CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Icon(Icons.delete, size: 18.0,),
                  ),
                  title: const Text('Delete Account',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                ),

                const Padding(
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
                const Padding(
                  padding: EdgeInsets.only(left: 15.0,top: 20.0),
                  child:  Text('FEEDBACK',  style: TextStyle(fontSize: 16.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                ),
                const SizedBox(height: 10.0),

                ListTile(
                  onTap: (){},
                  leading: const CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    child: Icon(Icons.bug_report, size: 18.0,),
                  ),
                  title: const Text('Report a Bug',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                ),

                ListTile(
                  onTap: (){},
                  leading: const CircleAvatar(
                    backgroundColor: Colors.purpleAccent,
                    child: Icon(Icons.thumb_up_sharp, size: 18.0,),
                  ),
                  title: const Text('Send Feedback',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
                ),



              ],
            ),

          ],
        ),
      ),
    );
  }
}