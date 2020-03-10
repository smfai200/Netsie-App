import 'package:flutter/material.dart';
import 'package:netsieapp/models/API/Category.dart';
import 'package:netsieapp/API/Home_Requests.dart';

Widget Categories(){
  var obj = Category_Model();

  return FutureBuilder(
    builder: (context, projectSnap) {
      if ((projectSnap.connectionState == ConnectionState.none &&
          projectSnap.hasData == null) || projectSnap.data == null) {
        //print('project snapshot data is: ${projectSnap.data}');
        return Center(
          child:CircularProgressIndicator(),
        );
      }

      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        scrollDirection: Axis.horizontal,
        itemCount: obj.category_labels.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            width: 160.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFD45253),
                  Color(0xFF9E1F28),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF9E1F28),
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                obj.category_labels[index].toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.8,
                ),
              ),
            ),
          );
        },
      );
    },
    future: Get_All_Categories(),
  );
}