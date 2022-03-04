import 'package:flutter/material.dart';
import 'package:new_project_work/widgets/simmer/main_shimmer.dart';

class HomeworkShimmer extends StatelessWidget {
  const HomeworkShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(

      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top: 5.0, left: 5, right: 5),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey.shade100,
            ),
            child:  Center(child: ShimmerWidget.rectangular(
              height: 8,
              width: 50,
            ),),
          ), //SUBJECTS

          Container(
              margin: const EdgeInsets.only(left: 2.0, right: 2.0, top: 7),
              padding: EdgeInsets.only(top: 15,left: 30,right: 30),
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width / 1.2,
              color: Colors.grey.shade100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShimmerWidget.rectangular(height: 8, width: 50),
                      SizedBox(
                        height: 2,
                      ),
                      ShimmerWidget.rectangular(
                        height: 6,
                        width: 35,
                      ),
                    ],
                  ), //homework date

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShimmerWidget.rectangular(
                        height: 8,
                        width: 50,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      ShimmerWidget.rectangular(
                        height: 6,
                        width: 35,
                      ),
                    ],
                  ), //submissiondate
                ],
              )),  //DATES

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 10),
            child: ShimmerWidget.rectangular(
              height: 6,
            ),
          ), //DIVIDER

          Expanded(
            child: GridView.count(
              padding: EdgeInsets.symmetric(horizontal: 10),
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: List.generate(4, (index) => Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:Center(
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerWidget.rectangular(
                        height: 30,
                        width: 30,
                        shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      ShimmerWidget.rectangular(
                        height: 4,
                        width: 35,
                        shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ],
                  ),),
              ),),
            ),),

        ],
      ),
    );
  }
}
