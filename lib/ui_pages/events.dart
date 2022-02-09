import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_project_work/models/event_list.dart';
import 'package:new_project_work/widgets/event_screen.dart';

import 'package:new_project_work/widgets/text_field.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<EventList> list = [
      EventList(
        image: 'images/marathon.jpg',
        text: '5 Kilometer \nDowntown Run',
        onpress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventScreen(
                        image: 'images/marathon.jpg',
                        text: 'Running is good for health. \n'
                            'So, participate in our marathon to win certificates and exiciting prizes.\n'
                            'Total distance to jog is only 5KM and there will be services provided throughout the race.\nPopular guest are arriving, below you can see a glimpse of who they are.',
                      )));
        },
      ),
      EventList(
        image: 'images/games.jpg',
        text: 'Play GAMES \nWin MONEY !!',
        onpress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventScreen(
                        image: 'images/games.jpg',
                        text: 'Want to win some money playing GAMES ?? \n'
                            'Here we have Outdoor games such as : Crcket, Football, BasketBall, Badminton and much more plus students are able to play indoor games such as: Table Tennis, Snooker, Pool.\n'
                            'BONUS: PLAYSTATION GAMES TOO ARE AVAILABLE',
                      )));
        },
      ),
      EventList(
        image: 'images/concert.jpg',
        text: 'READY TO \nROCK N ROLL',
        onpress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventScreen(
                        image: 'images/concert.jpg',
                        text:
                            'We highly encourage students to participate in singing competetion we are hosting this year.\n You could win amazing instruments if you are th top 3 singers \n'
                            'BONUS: check the guest list for singers to perform , they could be an inspiration for you. ',
                      )));
        },
      ),
    ];

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //       onPressed: (){Navigator.pop(context);},
      //       icon: Icon(Icons.arrow_back, color: Colors.black),
      //   ),
      //   title: Text('Events', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       onPressed: (){},
      //       icon: Icon(Icons.search, size: 25.0,color: Colors.black54),
      //     ),
      //   ],
      // ),

      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Events',
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1.0),
                ),
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage("images/profile.png"),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          NewTextField(
            text: 'Search your events',

          ),
          SizedBox(
            height: 15.0,
          ),
          ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: HexColor("#F4F4F4")),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(.06),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(4, 3), // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image(
                            image: AssetImage(list[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                list[index].text,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    list[index].onpress();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blueAccent, // background
                                  ),
                                  child: Text('See More',
                                      style: TextStyle(color: Colors.white))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
