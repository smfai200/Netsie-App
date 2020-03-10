import 'package:flutter/material.dart';
import 'package:netsieapp/widgets/content_scrollstory.dart';
import 'package:netsieapp/models/API/Story.dart';
import 'package:netsieapp/API/Home_Requests.dart';

Widget PopularStories(Function onclick){
  var obj = Story_Model();
  print(obj.stories_popular.toString());
  return ContentScroll(
    images: obj.stories_popular,
    title: 'Popular Stories',
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
//        images: obj.stories_popular,
//        title: 'My List',
//        imageHeight: 250.0,
//        imageWidth: 150.0,
//        onclick: onclick,
//      );
//    },
//    future: Get_Latest15_Stories(),
//  );
}