import 'package:flutter/material.dart';
import 'package:new_project_work/models/library_books.dart';
import 'package:new_project_work/utils/color.dart';
import 'package:new_project_work/widgets/appbar.dart';
import 'package:new_project_work/widgets/library_books.dart';
import 'package:new_project_work/widgets/text_field.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {


  @override
  Widget build(BuildContext context) {

    List<Books> book = [
      Books(
        image: 'images/book2.jpg',
        title: 'First Book',
        author: 'Mr. XXX YYY',
        price: 200,
        onpress: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> LibraryBooks(
            title: 'Title of Book',
            image: 'images/book2.jpg',
            price: 200,
            description: "In a world that promises a 30 days time travelling \nand 'one secret trick' to fix your life,\n"
                "podcast host and author KK unmasks the hidden internal forces",
            author: 'Kalind Koirala',
          )));
        },
      ),
      Books(
        image: 'images/book3.jpg',
        title: 'Second Book',
        author: 'Mr. XXXX YYY',
        price: 300,
        onpress: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> LibraryBooks(
            title: 'Title of Book',
            image: 'images/book3.jpg',
            price: 300,
            description: "In a world that promises a 30 days time travelling \nand 'one secret trick' to fix your life,\n"
                "podcast host and author KK unmasks the hidden internal forces",
            author: 'Kalind Koirala',
          )));
        },
      ),
      Books(
        image: 'images/book4.jpg',
        title: 'Third Book',
        author: 'Mr. XXXX YYY',
        price: 400,
        onpress: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> LibraryBooks(
            title: 'Title of Book',
            image: 'images/book4.jpg',
            price: 400,
            description: "In a world that promises a 30 days time travelling \nand 'one secret trick' to fix your life,\n"
                "podcast host and author KK unmasks the hidden internal forces",
            author: 'Kalind Koirala',
          )));
        },
      ),
      Books(
        image: 'images/book5.webp',
        title: 'Fourth Book',
        author: 'Mr. XXXX YYY',
        price: 500,
        onpress: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> LibraryBooks(
            title: 'Title of Book',
            image: 'images/book5.webp',
            price: 500,
            description: "In a world that promises a 30 days time travelling \nand 'one secret trick' to fix your life,\n"
                "podcast host and author KK unmasks the hidden internal forces",
            author: 'Kalind Koirala',
          )));
        },
      ),
      Books(
        image: 'images/book6.jpg',
        title: 'Fifth Book',
        author: 'Mr. XXXX YYY',
        price: 600,
        onpress: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> LibraryBooks(
          title: 'Title of Book',
          image: 'images/book6.jpg',
          price: 600,
          description: "In a world that promises a 30 days time travelling \nand 'one secret trick' to fix your life,\n"
              "podcast host and author KK unmasks the hidden internal forces",
          author: 'Kalind Koirala',
        )));},
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(child: WidgetAppbar(color: pink,title: 'Library', onPress: (){Navigator.pop(context);}, icon: Icons.arrow_back), preferredSize: Size.fromHeight(55.0),),

        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          children: [
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Text(
                'Discover Latest Book',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'OpenSans'),
              ),
            ),
            NewTextField(text: 'Titles, authors or topics'),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                  labelPadding: EdgeInsets.all(0),
                  indicatorPadding: EdgeInsets.all(0),
                  isScrollable: true,
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.grey.shade300,
                  labelStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans'),
                  unselectedLabelStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans'),
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.0, color: Colors.black),
                    insets: EdgeInsets.only(right: 35.0),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text('New'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text('Trending'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text('Best Seller'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
              // height: 210,
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(4, 3), // changes position of shadow
                    ),
                  ]
              ),
              child: ListView.builder(
                // padding: EdgeInsets.only(left: 6, right: 6),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: book.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.transparent,
                      // border: Border.all(
                      //   color: HexColor('#F4F4F4'),
                      //   width: 2.0,
                      // ),
                      image: DecorationImage(
                        image: AssetImage(book[index].image),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    // child: ClipRRect(
                    //   borderRadius: BorderRadius.circular(15.0),
                    //   child: Image(
                    //     image: AssetImage(book[index].image),
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Text(
                'Popular',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'OpenSans'),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                itemCount: book.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7.0),
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.09),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(4, 3), // changes position of shadow
                          ),
                        ]
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 3),
                          // height: MediaQuery.of(context).size.height * 0.25,
                          width: 62,
                          child: GestureDetector(
                            onTap: (){book[index].onpress();},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image(
                                image: AssetImage(book[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              book[index].title,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'OpenSans'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(book[index].author, style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black38,
                                fontFamily: 'OpenSans'),),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Rs.${book[index].price}'.toString(), style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'OpenSans'),),
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
