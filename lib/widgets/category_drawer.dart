import 'package:flutter/material.dart';
import 'package:new_project_work/widgets/admin_bio.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';

class CategoryDrawer extends StatefulWidget {
  const CategoryDrawer({Key? key}) : super(key: key);

  @override
  State<CategoryDrawer> createState() => _CategoryDrawerState();
}

class _CategoryDrawerState extends State<CategoryDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 50.0,
                    backgroundImage: AssetImage("images/excellogo.png"),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Kalind Koirala',
                    style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),

                  ),
                  Text(
                    'Admin',
                    style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.normal),

                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.black,
            ),
            title: Text(
              'Your Profile',
              style:
                    TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),

            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminBio(
                            text: 'Kalind Koirala',
                            bio:
                                'My name is Kalind and I am a freelance mobile app developer\n If you need any mobile app for your company then contact me for more informations. ',
                            jobtitle: 'Job',
                            answer1: 'App Developer',
                            length: 'Time',
                            answer2: '1+ Year',
                            question: 'Teacher ?',
                            answer3: 'YES',
                          )));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.mail,
              color: Colors.black,
            ),
            title: Text(
              'Inbox',
              style:
                    TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),

            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.assessment,
              color: Colors.black,
            ),
            title: Text(
              'Dashboard',
              style:
                    TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),

            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: Text(
              'Settings',
              style:
                    TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),

            ),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Notice()));
            },
          ),
        ],
      ),
    );
  }
}
