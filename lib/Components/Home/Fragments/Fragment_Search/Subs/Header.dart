import 'package:flutter/material.dart';
import 'package:netsieapp/utilities/colors.dart';
import 'CircularContainer.dart';

String searchQuery;

Widget header(BuildContext context,Function callback_btn) {
  var width = MediaQuery.of(context).size.width;
  return ClipRRect(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
    child: Container(
        height: 200,
        width: width,
        decoration: BoxDecoration(
          color: LightColor.purple,
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                top: 30,
                right: -100,
                child: circularContainer(300, LightColor.lightpurple)),
            Positioned(
                top: -100,
                left: -45,
                child: circularContainer(width * .5, LightColor.darkpurple)),
            Positioned(
                top: -180,
                right: -30,
                child: circularContainer(width * .7, Colors.transparent,
                    borderColor: Colors.white38)),
            Positioned(
                top: 40,
                left: 0,
                child: Container(
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Search Story,Season And Episodes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                              icon:Icon(Icons.search),
                              color: Colors.white,
                              onPressed: () {
                                callback_btn(searchQuery);
                              },
                            )
                          ],
                        ),
                        SizedBox(height: 3),
                        TextField(
                          onChanged: (text){
                            TextSearch_callback(text);
                          },
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Search Title',
                            hintStyle: TextStyle(
                              color:Colors.white
                            )
                          )
                        ),
                      ],
                    )))
          ],
        )),
  );
}

void TextSearch_callback(String text) {
  searchQuery = text;
}



