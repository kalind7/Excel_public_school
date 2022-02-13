import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LibraryBooks extends StatelessWidget {
  const LibraryBooks({Key? key, required this.image, required this.title, required this.author, required this.description, required this.price}) : super(key: key);

  final String image;
  final String title;
  final String author;
  final String description;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.orange.shade100,
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              flexibleSpace: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: [

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 40, top: 30),
                        height: MediaQuery.of(context).size.height /3,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(image),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 20.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'MontserratAlternates'),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 27.0, top: 10.0),
                  child: Text(
                    author,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'MontserratAlternates'),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 27.0, top: 10.0),
                  child: Text(
                    'Rs. ${price.toString()}',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.pink.shade100,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'MontserratAlternates'),
                  ),
                ),


                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  margin: EdgeInsets.only(left: 27.0, top: 15.0),
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
                        insets: EdgeInsets.only(right: 65.0),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 23),
                            child: Text('Description'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 23),
                            child: Text('Reviews(20)'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 23),
                            child: Text('Similar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.only(left: 27.0, top: 15.0, right: 20),
                  child: Text(
                    description,
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.black45,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'MontserratAlternates'),
                  ),
                ),


               Padding(
                 padding: EdgeInsets.only(top: 20, left: 27, right: 37),
                 child:  ElevatedButton(
                   onPressed: () {},
                   style: ElevatedButton.styleFrom(
                     primary: Colors.pink.shade100,
                     elevation: 2,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10)),
                   ),
                   child: Text(
                     'Add to Library',
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 16,
                         fontFamily: 'MontserratAlternates'),
                   ),
                 ),
               ),



              ],
            ),),
          ],
        ),
      ),
    );
  }
}


