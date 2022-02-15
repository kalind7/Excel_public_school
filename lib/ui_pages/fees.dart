import 'package:flutter/material.dart';
import 'package:new_project_work/models/fees_list.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/logout_popup.dart';
import 'package:pie_chart/pie_chart.dart';


class Fees extends StatefulWidget {
  const Fees({Key? key}) : super(key: key);

  @override
  _FeesState createState() => _FeesState();
}

class _FeesState extends State<Fees> {
  Map<String, double> dataMap = {
    "Past Dues": 20000,
    "Future Dues": 30000,
    "Total Collected": 50000,
  };

  @override
  Widget build(BuildContext context) {
    List<FeesList> list = [
      FeesList(
        title: 'Fee Collection',
        icon: Icons.attach_money,
        heading1: 'Today(2022-2-9)',
        answer1: 'Rs. 10,000',
        heading2: 'This Week',
        answer2: 'Rs. 20,000',
        heading3: 'This Month',
        answer3: 'Rs. 70,000',
        heading4: 'This year',
        answer4: 'Rs. 2,50,000',
      ),
      FeesList(
        title: ' Student Admissions',
        icon: Icons.school,
        heading1: 'Today(2022-2-9)',
        answer1: '2',
        heading2: 'This Week',
        answer2: '5',
        heading3: 'This Month',
        answer3: '20',
        heading4: 'This year',
        answer4: '300',
      ),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: WidgetAppbar(title: 'FEES', onPress: (){Navigator.pop(context);}, icon: Icons.arrow_back),
          preferredSize: Size.fromHeight(55.0),
        ),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          children: [
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    margin: EdgeInsets.only(top: 10.0, left: 7.0, right: 7.0),
                    height: MediaQuery.of(context).size.height / 3.25,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.25),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(4, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(list[index].icon, size: 20.0, color: Colors.black),
                            SizedBox(width: 10.0),
                            Text(
                              list[index].title,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'OpenSans',
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              list[index].heading1,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'OpenSans',
                                  color: Colors.black45),
                            ),
                            Text(
                              list[index].answer1,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'OpenSans',
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                        Divider(
                          height: 20.0,
                          thickness: 2.0,
                          color: Colors.black12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              list[index].heading2,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'OpenSans',
                                  color: Colors.black45),
                            ),
                            Text(
                              list[index].answer2,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'OpenSans',
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                        Divider(
                          height: 20.0,
                          thickness: 2.0,
                          color: Colors.black12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              list[index].heading3,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'OpenSans',
                                  color: Colors.black45),
                            ),
                            Text(
                              list[index].answer3,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'OpenSans',
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                        Divider(
                          height: 20.0,
                          thickness: 2.0,
                          color: Colors.black12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              list[index].heading4,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'OpenSans',
                                  color: Colors.black45),
                            ),
                            Text(
                              list[index].answer4,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'OpenSans',
                                  color: Colors.black45),
                            ),
                          ],
                        ),

                      ],
                    ),
                  );
                }),

            Container(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              margin: EdgeInsets.only(top: 10.0, left: 7.0, right: 7.0, bottom: 5.0),
              height: MediaQuery.of(context).size.height /2.4 ,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.25),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(4, 3), // changes position of shadow
                  ),
                ],
              ),

              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.stacked_bar_chart, size: 20, color: Colors.black,),
                      SizedBox(width: 10.0),
                      Text(
                        'Fee Stats',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSans',
                            color: Colors.black54),
                      ),
                    ],
                  ),

                  PieChart(dataMap: dataMap),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),

                    child: Text('Total Fees: Rs. 10,000',style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                        color: Colors.black54),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
