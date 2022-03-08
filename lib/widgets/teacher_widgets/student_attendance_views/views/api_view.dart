import 'package:flutter/material.dart';

class ApiView extends StatefulWidget {
  const ApiView({Key? key}) : super(key: key);

  @override
  _ApiViewState createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Services'),
      ),
      body: Container(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
