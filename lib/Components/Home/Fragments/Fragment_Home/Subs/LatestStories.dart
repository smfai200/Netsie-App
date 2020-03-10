import 'package:flutter/material.dart';
import 'package:netsieapp/widgets/content_scroll.dart';
import 'package:netsieapp/models/API/Story.dart';
import 'package:netsieapp/API/Home_Requests.dart';
import 'package:netsieapp/models/API/Category.dart';

Widget LatestStories(Function onclick){
//  var obj = Story_Model();
  var obj = Category_Model();
  return ContentScroll(
    images: obj.categorylist,
    title: 'Categories',
    imageHeight: 250.0,
    imageWidth: 150.0,
    onclick: onclick,
  );

//  return FutureBuilder(
//    builder: (context, projectSnap) {
//      if (projectSnap.connectionState == ConnectionState.none &&
//          projectSnap.hasData == null) {
//        //print('project snapshot data is: ${projectSnap.data}');
//        return Container();
//      }
//
//      return ContentScroll(
//        images: obj.categorylist,
//        title: 'My List',
//        imageHeight: 250.0,
//        imageWidth: 150.0,
//        onclick: onclick,
//      );
//    },
//    future: Get_All_Categories(),
//  );
}