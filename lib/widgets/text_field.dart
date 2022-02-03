import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NewTextField extends StatelessWidget {
  const NewTextField({Key? key, required this.text}) : super(key: key);


  final String text;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 330.0,
            height: 56.0,
            decoration:BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor("#F4F4F4")),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.08),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(4, 3), // changes position of shadow
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.only(top:8.0),
              child:  TextField(
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,

                    isDense: false,
                    hintText: text,
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                    ),

                    prefixIcon:  IconButton(
                        onPressed: () {
                        },
                        icon: Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.black,
                        )),
                  ),
                ),

            ),
          ),

        ],
      ),
    );
  }
}
