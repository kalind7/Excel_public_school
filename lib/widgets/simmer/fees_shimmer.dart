import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project_work/widgets/simmer/main_shimmer.dart';

class FeesShimmer extends StatelessWidget {
  const FeesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Expanded(child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) =>
             Container(
               padding: EdgeInsets.symmetric(horizontal: 7.0),
               height: MediaQuery.of(context).size.height * 0.15,
               width: MediaQuery.of(context).size.width / 4,
               child:  Row(
                 children: [

                   ShimmerWidget.rectangular(
                     height: MediaQuery.of(context).size.height * 0.125,
                     width: MediaQuery.of(context).size.width * 0.2,
                     shapeBorder: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(3.0),
                     ),
                     child: Center(child:
                       ShimmerWidget.rectangular(
                           height: MediaQuery.of(context).size.height * 0.0125,
                         width: MediaQuery.of(context).size.width * 0.02,
                       ),

                       ),
                   ),

                   SizedBox(width: 10,),

                   ShimmerWidget.rectangular(
                     height: MediaQuery.of(context).size.height * 0.125,
                     width:  MediaQuery.of(context).size.width / 1.37,
                     shapeBorder: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(3.0),
                     ),
                     child: Center(
                       child: Row(
                         children: [
                           Column(
                             children: [
                               ShimmerWidget.rectangular(
                                 height: 10,
                                 width: 20,
                               ),
                               SizedBox(height: 3.0,),

                               ShimmerWidget.rectangular(
                                 height: 10,
                                 width: 10,
                               ),
                             ],
                           ),

                           Column(
                             children: [
                               ShimmerWidget.rectangular(
                                 height: 10,
                                 width: 20,
                               ),
                               SizedBox(height: 3.0,),

                               ShimmerWidget.rectangular(
                                 height: 20,
                                 width: 30,
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),

                 ],
               ),
             ),
        ),),
      ],
    );
  }
}
