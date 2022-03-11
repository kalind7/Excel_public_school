import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';

class HomeworkListTable extends StatelessWidget {
  const HomeworkListTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
            color: pink,
            icon: Icons.arrow_back,
            title: 'Homework List',
            onPress: () {
              Get.back();
            }),
      ),
      body: ListView(
        // padding: EdgeInsets.symmetric(horizontal: 7),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10),child: Text(
            'Homework List (Monthly)',
            style: TextStyle(
                fontSize: 18,
                color: pink,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700),
          ),),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.pink.shade300, width: 0.5),
            ),
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
