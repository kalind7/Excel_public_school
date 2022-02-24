import 'package:flutter/material.dart';
import 'package:new_project_work/widgets/simmer/main_shimmer.dart';
class CalendarShimmer extends StatelessWidget {
  const CalendarShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShimmerWidget.rectangular(
              height: 40,
              width: 70,
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            SizedBox(width: 10.0,),
            ShimmerWidget.rectangular(
              height: 40,
              width: 70,
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ],
        ),
        SizedBox(height: 10,),
        ShimmerWidget.rectangular(
          height: MediaQuery.of(context).size.height * 0.05 ,
          width: MediaQuery.of(context).size.width * 0.96,
          shapeBorder:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        SizedBox(height: 2.0,),
        ShimmerWidget.rectangular(
          height: MediaQuery.of(context).size.height * 0.40 ,
          width: MediaQuery.of(context).size.width * 0.96,
          shapeBorder:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) => ListTile(
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      ShimmerWidget.rectangular(
                        width: 50,
                        height: 50,
                        shapeBorder:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),

                      const SizedBox(height: 1,),

                      ShimmerWidget.rectangular(
                        width:  MediaQuery.of(context).size.width * 0.11,
                        height: 5,
                      ),
                    ],
                  ),

                  const SizedBox(width: 7,),

                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child:  ShimmerWidget.rectangular(
                      width:  4,
                      height: 40,
                    ),
                  ),

                ],
              ),
              title:  Align(
                alignment: Alignment.centerLeft,
                child: ShimmerWidget.rectangular(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 16,
                ),
              ),
              subtitle:  Align(
                alignment: Alignment.centerLeft,
                child: ShimmerWidget.rectangular(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
