import 'package:flutter/material.dart';
import 'package:netsieapp/utilities/colors.dart';
import 'CategoryRow.dart';

Widget card(
    img,
    width,
    {
      Color primary = Colors.redAccent,
      String imgPath,
      String chipText1 = '',
      String chipText2 = '',
      Widget backWidget,
      Color chipColor = LightColor.orange,
      bool isPrimaryCard = false}) {
  return Container(
      height: isPrimaryCard ? 190 : 180,
      width: isPrimaryCard ? width * .32 : width * .32,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          color: primary.withAlpha(200),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 10,
                color: LightColor.lightpurple.withAlpha(20))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(img),
            ),
          ),
          child: Stack(
            children: <Widget>[
              backWidget,
              Positioned(
                bottom: 10,
                left: 10,
                child: _cardInfo(width,chipText1, chipText2,
                    LightColor.titleTextColor, chipColor,
                    isPrimaryCard: isPrimaryCard),
              )
            ],
          ),
        ),
      ));
}

Widget _cardInfo(width,String title, String courses, Color textColor, Color primary,
    {bool isPrimaryCard = false}) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 10),
          width: width * .32,
          alignment: Alignment.topCenter,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isPrimaryCard ? Colors.white : textColor),
          ),
        ),
        SizedBox(height: 5),
        chip(courses, primary, height: 5, isPrimaryCard: isPrimaryCard)
      ],
    ),
  );
}