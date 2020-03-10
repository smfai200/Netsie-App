import 'package:flutter/material.dart';
import 'package:netsieapp/utilities/colors.dart';
import 'DecorationContainers.dart';
import 'Card.dart';
import 'package:netsieapp/models/API/Story.dart';
import 'package:netsieapp/Components/Story/storydetails_screen.dart';

var StoryModel = Story_Model();

Widget featuredRowA(context,width) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          for (var story in StoryModel.search_storylist) ...[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => StoryDetailsScreen(movieobj: story)));
              },
              child:card(
                story["Story_Image"],
                width,
                primary: LightColor.orange,
                backWidget:
                decorationContainerA(LightColor.darkBlue, 50, -30),
                chipColor: LightColor.orange,
                chipText1: story["id"].toString(),
                chipText2: story["Story_Title"],
                isPrimaryCard: true,
                imgPath: story["Story_Image"])),
          ]
        ],
      ),
    ),
  );
}