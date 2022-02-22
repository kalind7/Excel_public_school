import 'package:flutter/material.dart';
import 'package:new_project_work/utils/color.dart';

class NewTextField extends StatelessWidget {
  const NewTextField({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.94,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: orangeOne, width: 0.5),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.08),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(4, 3), // changes position of shadow
                  ),
                ]),
              child: TextField(
                decoration: InputDecoration(
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  isDense: false,
                  hintText: text,
                  hintStyle: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'OpenSans'
                  ),

                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black,
                      )),
                ),
              ),

          ),
        ],
      ),
    );
  }
}
