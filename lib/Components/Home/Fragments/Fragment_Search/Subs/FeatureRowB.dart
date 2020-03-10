import 'package:flutter/material.dart';
import 'package:netsieapp/models/API/Story.dart';
import 'package:netsieapp/utilities/colors.dart';
import 'DecorationContainers.dart';
import 'Card.dart';
import 'package:netsieapp/models/API/Season.dart';
import 'package:netsieapp/Components/Story/storydetails_screen.dart';

var SeasonModel = Season_Model();

Widget featuredRowB(context,width) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
      for (var season in SeasonModel.search_seasonlist) ...[
        GestureDetector(
              onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => StoryDetailsScreen(movieobj: Story_Model().GetStory_SearchByFK(season["Fk_Story"]))));
        },
          child:
          card(season["Season_Image"],
              width,
              primary: LightColor.seeBlue,
              chipColor: LightColor.seeBlue,
              backWidget: decorationContainerA(LightColor.darkBlue, 50, -30),
              chipText1: season["Fk_Story"].toString(),
              chipText2: season["Season_Title"],
              isPrimaryCard: true,
              imgPath:season["Season_Image"])),
        ]
      ],
      ),
    ),
  );
}