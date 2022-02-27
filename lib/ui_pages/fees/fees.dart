
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/controller/fees/fees_controller.dart';
import 'package:new_project_work/ui_pages/fees/widget_pop_up.dart';
import 'package:new_project_work/ui_pages/student/widget/profile_body_container.dart';
import 'package:new_project_work/utils/fonts.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/simmer/fees_shimmer.dart';

class Fees extends StatefulWidget {
   Fees({Key? key}) : super(key: key);
  @override
  _FeesState createState() => _FeesState();
}

class _FeesState extends State<Fees> {

  final feesController = Get.put(FeeController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppbar(
          title: 'Fees',
          onPress: () {},
        ),
      ),
      body: ProfileBodyContainer(
       text: 'Net Payable Rs. 2200',
       widget: Expanded(
         child: Obx(()=> feesController.isLoading.value? FeesShimmer(): ListView.builder(
             itemCount: feesController.feeList.length,
             itemBuilder: (context, index) {
               var  myitem = feesController.feeList[index];
               return  Container(
                 padding: EdgeInsets.symmetric(horizontal: 7),
                 height: height * 0.15,
                 width: width / 4,
                 child: Row(
                   children: [
                     Flexible(
                       child: Container(
                         height: height * 0.125,
                         width: width * 0.22,
                         decoration: BoxDecoration(
                           color:myitem.status? Colors.green: Colors.red,
                           borderRadius: BorderRadius.circular(3.0),
                         ),
                         child: Center(
                           child: Text(myitem.month, style: monthTitle),
                         ),
                       ),
                     ),
                     SizedBox(
                       width: 12,
                     ),
                     Flexible(
                       flex: 3,
                       child: Container(
                         // padding: EdgeInsets.symmetric(vertical: 10),
                         height: height * 0.125,
                         width: width / 1.25,
                         decoration: BoxDecoration(
                           color: myitem.status? Colors.green: Colors.red,
                           borderRadius: BorderRadius.circular(3.0),
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(myitem.invoice, style: firstTitle),
                                 SizedBox(
                                   height: 3.0,
                                 ),
                                 Text(myitem.date, style: secondTitle),
                               ],
                             ),
                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(myitem.status? '${myitem.amount1}' : '${myitem.amount2}', style: firstTitle),
                                 GestureDetector(
                                   onTap: () {
                                     showDialog(
                                         context: context,
                                         builder: (BuildContext context) {
                                           return feesPopup(context);
                                         });

                                     print('Container');
                                   },
                                   child: Container(
                                     padding: EdgeInsets.only(bottom: 2.0),
                                     margin: EdgeInsets.only(top: 3.0),
                                     height: height * 0.035,
                                     width: width * 0.24,
                                     decoration: BoxDecoration(
                                         color: Colors.transparent,
                                         border: Border.all(
                                             color: Colors.white, width: 1)),
                                     child: Center(
                                       child: Text(myitem.details,
                                           style: secondTitle),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               );
             }),)
       ),
     ),
     
    );
  }
}

