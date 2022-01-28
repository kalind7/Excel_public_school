import 'package:flutter/material.dart';

class TextField extends StatefulWidget {
  const TextField({Key? key}) : super(key: key);
  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {

  late String email;
  late String password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

