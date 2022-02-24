import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerFooter extends StatelessWidget {
  const DrawerFooter({Key? key}) : super(key: key);

  final String _facebook = 'https://www.facebook.com/allstartechnos';
  final String _linkedIn = 'https://www.linkedin.com/company/allstar-techno/about';
  final String _youtube = 'https://www.youtube.com/channel/UCsdGOZxPJFdfv42oqfJ3xkQ';

  void _launchFacebook() async {
    if (await canLaunch(_facebook)) {
      await launch(_facebook);
    } else {
      throw "could not open $_facebook";
    }
  }

  void _launchLinkedin() async {
    if (await canLaunch(_linkedIn)) {
      await launch(_linkedIn);
    } else {
      throw "could not open $_linkedIn";
    }
  }
  void _launchYoutube () async {
    if (await canLaunch(_youtube)) {
      await launch(_youtube);
    } else {
      throw "could not open $_youtube";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10
          ,left: 10,right: 20.0),
      height: MediaQuery.of(context).size.height / 9,
      color: HexColor("#E1E5EC"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            iconSize: 80,
            icon: Image.asset(
              'images/allstart.png',
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _launchFacebook();
                  print('facebook');
                },
                child: Image(
                  height: 22,
                  width: 22,
                  image: AssetImage(
                    'assets/drawer_icons/facebook.png',
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  _launchYoutube();
                  print('youtube');
                },
                child: Image(
                  height: 22,
                  width: 22,
                  image: AssetImage(
                    'assets/drawer_icons/youtube.png',
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  _launchLinkedin();
                  print('linkedin');
                },
                child: Image(
                  height: 22,
                  width: 22,
                  image: AssetImage(
                    'assets/drawer_icons/linkedin.png',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
