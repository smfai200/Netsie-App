import 'package:flutter/material.dart';
import 'package:netsieapp/utilities/colors.dart';

Widget categoryRow(
    String title,
    Color primary,
    Color textColor,
    ) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    height: 30,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              color: LightColor.titleTextColor, fontWeight: FontWeight.bold),
        ),

      ],
    ),
  );
}


Widget chip(String text, Color textColor,
    {double height = 0, bool isPrimaryCard = false}) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: height),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      color: textColor.withAlpha(isPrimaryCard ? 200 : 50),
    ),
    child: Text(
      text,
      style: TextStyle(
          color: isPrimaryCard ? Colors.white : textColor, fontSize: 12),
    ),
  );
}