import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_project_work/models/library_books.dart';
import 'package:new_project_work/widgets/logout_popup.dart';
import 'package:new_project_work/widgets/text_field.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {

  List<Books> book = [
    Books(
      image: 'images/book2.jpg',
      name: 'First Book',
    ),
    Books(
      image: 'images/book3.jpg',
      name: 'Second Book',
    ),
    Books(
      image: 'images/book4.jpg',
      name: 'Third Book',
    ),
    Books(
      image: 'images/book5.webp',
      name: 'Fourth Book',
    ),
    Books(
      image: 'images/book6.jpg',
      name: 'Fifth Book',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library', style:  TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'MontserratAlternates'),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 3.0, top: 2.0),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => BuildPopupDialog(),
                );
              },
              icon: Icon(Icons.power_settings_new,
                  size: 24.0, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 5.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Text(
                'Discover Latest Book',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'MontserratAlternates'),
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
                        fontFamily: 'MontserratAlternates'),
                    unselectedLabelStyle: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'MontserratAlternates'),
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
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0 ),
              // height: 210,
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 6, right: 6),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: book.length,
                  itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5.0),
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                        border: Border.all(
                          color: HexColor('#F4F4F4'),
                          width: 2.0,
                        ),
                      image: DecorationImage(
                        image: AssetImage(book[index].image),
                      ),
                    ),
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
                    fontFamily: 'MontserratAlternates'),
              ),
            ),






          ],
        ),
      ),
    );
  }
}
