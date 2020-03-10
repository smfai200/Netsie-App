import 'package:flutter/material.dart';
import 'package:netsieapp/utilities/colors.dart';
import 'DecorationContainers.dart';
import 'Card.dart';
import 'package:netsieapp/models/API/Episode.dart';
import 'package:netsieapp/Components/Story/storydetails_screen.dart';
import 'package:netsieapp/models/API/Season.dart';
import 'package:netsieapp/models/API/Story.dart';

var EpisodeModel = Episode_Model();

Widget featuredRowC(context,width) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
      for (var episode in EpisodeModel.search_episodelist) ...[
        GestureDetector(
        onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => StoryDetailsScreen(movieobj: Season_Model().GetSeasonStory(episode["Episode_Season"]))));
            },
          child:
          card(episode["Episode_Image"],
              width,
              primary: LightColor.seeBlue,
              chipColor: LightColor.seeBlue,
              backWidget: decorationContainerA(LightColor.darkBlue, 50, -30),
              chipText1: episode["Episode_Season"].toString(),
              chipText2: episode["Episode_Title"],
              isPrimaryCard: true,
              imgPath:episode["Episode_Image"])),
        ],
    ]
      ),
    ),
  );
}