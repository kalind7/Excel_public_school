import 'package:flutter/material.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black,),
          ),
          title: const Text('AccountSettings',style: TextStyle(fontFamily: 'OpenSans',color: Colors.black),),
          backgroundColor: Colors.grey.shade200,
          shadowColor: Colors.transparent,
          centerTitle: true,
        ),

        body: ListView(
          children: [

            ListTile(
              title: const Text('Language', style: TextStyle(fontSize: 16.0, fontFamily: 'OpenSans', color: Colors.black87,fontWeight: FontWeight.w700)),
              trailing: DropdownButton(
                isDense: true,
                focusColor: Colors.white,
                underline: const SizedBox(),
                dropdownColor: Colors.white,
                style: const TextStyle(fontSize: 16.0, color: Colors.black87, fontFamily: 'OpenSans', ),
                value: _value,
                items: const [
                  DropdownMenuItem(
                    child: Text('Select Language'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('English'),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text('Nepali'),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text('Chinese'),
                    value: 4,
                  ),
                  DropdownMenuItem(
                    child: Text('Hindi'),
                    value: 5,
                  ),
                ],
                onChanged: (int? value){
                  setState(() {
                    _value = value!;
                  });
                },
              ),
            ),

            const Divider(
              height: 1.0,
              thickness: 1.0,
            ),

            ListTile(
              title: const Text('Location', style: TextStyle(fontSize: 16.0, fontFamily: 'OpenSans', color: Colors.black87,fontWeight: FontWeight.w700)),

              trailing: DropdownButton(
                isDense: true,
                focusColor: Colors.white,
                underline: const SizedBox(),
                dropdownColor: Colors.white,
                style: const TextStyle(fontSize: 16.0, color: Colors.black87, fontFamily: 'OpenSans', ),
                value: _value,
                items: const [
                  DropdownMenuItem(
                    child: Text('Select Location'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('USA'),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text('Nepal'),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text('China'),
                    value: 4,
                  ),
                  DropdownMenuItem(
                    child: Text('India'),
                    value: 5,
                  ),
                ],
                onChanged: (int? value){
                  setState(() {
                    _value = value!;
                  });
                },
              ),
            ),

            const ListTile(
              title: Text('Password', style: TextStyle(fontSize: 16.0, fontFamily: 'OpenSans', color: Colors.black87,fontWeight: FontWeight.w700)),
            ),

            const SizedBox(
                height: 10.0
            ),

            ListTile(
              onTap: (){},
              leading: const CircleAvatar(
                child: Icon(Icons.lock, size: 18.0,),
              ),
              title: const Text('Privacy',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
            ),
            const Divider(
              height: 1.0,
              thickness: 1.0,
            ),
            ListTile(
              onTap: (){},
              leading: const CircleAvatar(
                child: Icon(Icons.security, size: 18.0,),
              ),
              title: const Text('Security',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
            ),
            const Divider(
              height: 1.0,
              thickness: 1.0,
            ),
            ListTile(
              onTap: (){},
              leading: const CircleAvatar(
                child: Icon(Icons.library_books, size: 18.0,),
              ),
              title: const Text('Account Info',style: TextStyle(fontSize: 14.0, color: Colors.black87, fontFamily: 'OpenSans', fontWeight: FontWeight.bold),),
            ),
            const Divider(
              height: 1.0,
              thickness: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}