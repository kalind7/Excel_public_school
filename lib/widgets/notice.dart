import 'package:flutter/material.dart';
import 'package:new_project_work/models/notice_list.dart';

class Notice extends StatefulWidget {
  const Notice({
    Key? key,
  }) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    List<NoticeList> list = [

      NoticeList(
        image: 'images/marathon.jpg',
        title: 'Marathon',
        description: 'Running is good for health. \n'
            'So, participate in our marathon to win certificates and exiciting prizes.\n'
            'Total distance to jog is only 5KM and there will be services provided throughout the race.\nPopular guest are arriving, below you can see a glimpse of who they are.',
      ),
      NoticeList(
        image: 'images/concert.jpg',
        title: 'Concert',
        description: 'Want to win some money playing GAMES ?? \n'
            'Here we have Outdoor games such as : Crcket, Football, BasketBall, Badminton and much more plus students are able to play indoor games such as: Table Tennis, Snooker, Pool.\n'
            'BONUS: PLAYSTATION GAMES TOO ARE AVAILABLE',
      ),
      NoticeList(
        image: 'images/games.jpg',
        title: 'Games',
        description:
            'We highly encourage students to participate in singing competetion we are hosting this year.\n You could win amazing instruments if you are th top 3 singers \n'
            'BONUS: check the guest list for singers to perform , they could be an inspiration for you. ',
      ),
      NoticeList(
          image: 'images/memo.png',
          title: 'Memo',
          description:'images/memo.png'
      ),
      NoticeList(
          image: 'images/syllabus.png',
          title: 'Syllabus',
          description:'images/syllabus.png'
      ),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Notice'),
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(top: 10.0),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage(list[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  ExpansionTile(
                    title: Text(list[index].title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, letterSpacing: 1.0),),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(list[index].description,style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic, fontFamily: 'Gugi'),),
                      ),

                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
