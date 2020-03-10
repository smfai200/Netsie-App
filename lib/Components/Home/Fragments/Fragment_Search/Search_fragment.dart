import 'package:flutter/material.dart';
import 'package:netsieapp/utilities/colors.dart';
import '../BottomNavigation.dart';
import 'Subs/Header.dart';
import 'Subs/CategoryRow.dart';
import 'Subs/FeatureRowA.dart';
import 'Subs/FeatureRowB.dart';
import 'Subs/FeatureRowC.dart';
import 'package:netsieapp/models/API/Story.dart';
import 'package:netsieapp/models/API/Season.dart';
import 'package:netsieapp/models/API/Episode.dart';
import 'package:netsieapp/Components/Story/storydetails_screen.dart';


var SeasonModel = Season_Model();
var EpisodeModel = Episode_Model();

Widget SearchPage(context,searchcheck,Function callback,Function SearchCallback) {
  var width = MediaQuery.of(context).size.width;
  return Scaffold(
      bottomNavigationBar: BottomNavigation(callback),
      body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                header(context,SearchCallback),
                if(searchcheck == true) ...[
                  SizedBox(height: 20),
                  categoryRow("Stories", LightColor.orange, LightColor.orange),
                  featuredRowA(context,width),
                  SizedBox(height: 0),
                  categoryRow(
                      "Seasons", LightColor.purple, LightColor.darkpurple),
                  featuredRowB(context,width),
                  SizedBox(height: 0),
                  categoryRow(
                      "Episodes", LightColor.purple, LightColor.darkpurple),
                  featuredRowC(context,width)
                ]else
                  Container()

              ],
            ),
          )));
}


