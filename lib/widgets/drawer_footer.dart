
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerFooter extends StatelessWidget {
    const DrawerFooter({Key? key}) : super(key: key);

    final String _facebook = 'https://www.facebook.com/allstartechnos';
    final String _linkedIn = 'https://www.linkedin.com/company/allstar-techno/about' ;

    void _launchFacebook()async{
      if (await canLaunch(_facebook)){
        await launch(_facebook);
      }else{
        throw "could not open $_facebook";
      }
    }

    void _launchLinkedin()async{
      if (await canLaunch(_linkedIn)){
        await launch(_linkedIn);
      }else{
        throw "could not open $_linkedIn";
      }
    }


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(bottom: 22.0, left: 5.0, right: 22.0),
      height: MediaQuery.of(context).size.height / 8 ,
      color: HexColor("#E1E5EC"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: (){},
            iconSize: 100,
              icon: Image.asset('files/images/allstar.png',),
          ),

          Row(
            children: [

             GestureDetector(
               onTap: (){
                 _launchFacebook();
                 print('facebook');
               },
               child: Image(
                 height: 22,
                 width: 22,
                 image: AssetImage('files/drawer_icons/facebook.png',),
               ),
             ),
              SizedBox(width: 10.0,),
              GestureDetector(
                onTap: (){

                  print('youtube');
                },
                child: Image(
                  height: 22,
                  width: 22,
                  image: AssetImage('files/drawer_icons/youtube.png',),
                ),
              ),

              SizedBox(width: 10.0,),
              GestureDetector(
                onTap: (){
                  _launchLinkedin();
                  print('linkedin');
                },
                child: Image(
                  height: 22,
                  width: 22,
                  image: AssetImage('files/drawer_icons/linkedin.png',),
                ),
              ),

            ],
          ),
        ],
      ),
    );

  }
}
