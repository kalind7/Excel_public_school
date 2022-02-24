import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project_work/ui_pages/student/widget/profile_body_container.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';

class Fees extends StatelessWidget {
  const Fees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
          color: pink,
          title: '',
          onPress: (){},
        ),
      ),
      body: ProfileBodyContainer(
        text: 'Text',
        widget: Expanded(
          child: ListView.builder(
            itemCount: 10,
              itemBuilder: (context, index){
                return Text('haha');
              }),
        ),
      ),
    );
  }
}
