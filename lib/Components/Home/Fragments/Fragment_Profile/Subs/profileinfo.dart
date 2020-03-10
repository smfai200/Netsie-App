import 'package:flutter/material.dart';

profileInfo(String Fullname,Bio) {
  return Padding(
    padding: EdgeInsets.all(32.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          Fullname==null ? "":Fullname.replaceAll("\"", ""),
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        Text(
          Bio==null ? "":Bio.replaceAll("\"", ""),
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    ),
  );
}