import 'package:excel_public_school/models/notice_list.dart';
import 'package:excel_public_school/widgets/appbar.dart';
import 'package:flutter/material.dart';

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
    ];

    List<NoticeList> list2 = [

      NoticeList(
          image: 'images/memo.png',
          title: 'Fees',
          description: 'images/memo.png'
      ),

      NoticeList(
          image: 'images/syllabus.png',
          title: 'Syllabus',
          description: 'images/syllabus.png'
      ),
    ];

    return  SafeArea(
      child: Scaffold(
        appBar: PreferredSize(child: WidgetAppbar(title: 'Notice', onPress: (){Navigator.pop(context);}, icon: Icons.arrow_back), preferredSize: const Size.fromHeight(55.0),),
        body: ListView(
          children: [
            ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(
                              image: AssetImage(list[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        ExpansionTile(
                          title: Text(
                            list[index].title,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 15.0, bottom: 10.0),
                              child: Text(
                                list[index].description,
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Roboto'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),

            ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemCount: list2.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(
                              image: AssetImage(list2[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        ExpansionTile(
                          title: Text(
                            list2[index].title,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 15.0, bottom: 10.0),
                              child: Image(
                                image: AssetImage(list2[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}