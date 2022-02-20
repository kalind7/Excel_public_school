import 'package:excel_public_school/ui_pages/dashboard.dart';
import 'package:excel_public_school/utils/color.dart';
import 'package:excel_public_school/widgets/category_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class LandingPage extends StatelessWidget {
     const LandingPage({Key? key, required this.iconTitle, required this.onPress,  }) : super(key: key);

    final String iconTitle;
    final Function onPress;


  @override
  Widget build(BuildContext context) {

    return ListView(

              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height /2.5,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 15.0),
                        height: MediaQuery.of(context).size.height /3.5,
                        width: MediaQuery.of(context).size.width ,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [pinkOne, orangeOne, orangeOne],
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter),
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0))
                        ),
                        child: ListView(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(onPressed: (){
                                  onPress();
                                }, icon: SvgPicture.asset(iconTitle),),

                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.1,
                                ),
                                const Center(child: Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text( '', style: TextStyle(fontSize: 24.0, fontFamily: 'Roboto', fontWeight: FontWeight.w500, color: Colors.white),),
                                )),

                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.04,
                                ),


                                IconButton(onPressed: (){},icon: SvgPicture.asset('files/icons/search.svg'),),




                                // IconButton(onPressed: (){},icon: SvgPicture.asset('files/icons/menu.svg'),),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Stack(
                        children: [

                          const Align(
                            alignment: Alignment.center,
                            child:  Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 15, 50),
                              child:  CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.grey,
                                child: Image(
                                  height: 75,
                                  width: 75,
                                  image: AssetImage('files/images/excellogo.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                       Container(
                              margin: const EdgeInsets.only(top: 150.0,left: 20,right: 20),
                              height: MediaQuery.of(context).size.height * 0.125,
                              width: MediaQuery.of(context).size.width ,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(width: .5, color: orangeOne),
                                boxShadow: [
                                  BoxShadow(
                                    color: orangeOne.withOpacity(0.1),
                                    spreadRadius: 5,
                                    blurRadius: 2,
                                    offset: const Offset(0, 9), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('Ram Bahadur Aryal', style: TextStyle(fontSize: 24.0,fontFamily: 'OpenSans',fontWeight: FontWeight.w600,color: pinkOne),),
                              ),
                            ),

                        ],
                      ),
                    ],
                  ),
                ),



              ],
            );

  }
}
