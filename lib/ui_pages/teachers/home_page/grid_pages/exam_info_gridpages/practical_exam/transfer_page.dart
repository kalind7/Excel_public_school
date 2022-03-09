import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/ui_pages/student/widget/body_container_with_widget.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          child: WidgetAppbar(
            title: 'Add Exam Practical',
            icon: Icons.arrow_back ,
            onPress: () => Get.back(),
          ),
          preferredSize: Size.fromHeight(55.0),
      ),
      body: BodyWithWidgetContainer(
        top: 100,
        upperWidget: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(child: Text('Practical Marks', style: TextStyle(fontSize: 15, color: pink,fontFamily: 'Roboto',fontWeight: FontWeight.w600),),),
        ),

          bodyWidget: Container(

          ),
      ),
    );
  }
}
