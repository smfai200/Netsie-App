import 'package:flutter/material.dart';
import 'package:netsieapp/Components/Story/storydetails_screen.dart';
import 'package:netsieapp/models/API/Story.dart';
import 'package:netsieapp/API/Home_Requests.dart';
import 'package:netsieapp/widgets/content_scroll.dart';

movieSelector(BuildContext context, int index,_pageController) {
  var obj = Story_Model();

  return AnimatedBuilder(
    animation: _pageController,
    builder: (BuildContext context, Widget widget) {
      double value = 1;
      if (_pageController.position.haveDimensions) {
        value = _pageController.page - index;
        value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
      }
      return Center(
        child: SizedBox(
          height: Curves.easeInOut.transform(value) * 270.0,
          width: Curves.easeInOut.transform(value) * 400.0,
          child: widget,
        ),
      );
    },
    child: GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => StoryDetailsScreen(movieobj: obj.stories_top[index]),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Center(
                child: Hero(
                  tag: index.toString(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 220.0,
                      child: GetNetworkImage(obj.stories_top,index),
                    ),
//                              child: Image(
//                                image: AssetImage(movies[index].imageUrl),
//                                height: 220.0,
//                                fit: BoxFit.cover,
//                              ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30.0,
            bottom: 40.0,
            child: Container(
              width: 250.0,
              child: Text(
                obj.stories_top[index]["Story_Title"].toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

//  return FutureBuilder(
//      builder: (context, projectSnap) {
//        if ((projectSnap.connectionState == ConnectionState.none &&
//            projectSnap.hasData == null) || projectSnap.data == null) {
//          //print('project snapshot data is: ${projectSnap.data}');
//          return Container();
//        }
//
//        return AnimatedBuilder(
//          animation: _pageController,
//          builder: (BuildContext context, Widget widget) {
//            double value = 1;
//            if (_pageController.position.haveDimensions) {
//              value = _pageController.page - index;
//              value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
//            }
//            return Center(
//              child: SizedBox(
//                height: Curves.easeInOut.transform(value) * 270.0,
//                width: Curves.easeInOut.transform(value) * 400.0,
//                child: widget,
//              ),
//            );
//          },
//          child: GestureDetector(
//            onTap: () => Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (_) => StoryDetailsScreen(movieobj: obj.stories_top[index]),
//              ),
//            ),
//            child: Stack(
//              children: <Widget>[
//                Center(
//                  child: Container(
//                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(10.0),
//                      boxShadow: [
//                        BoxShadow(
//                          color: Colors.black54,
//                          offset: Offset(0.0, 4.0),
//                          blurRadius: 10.0,
//                        ),
//                      ],
//                    ),
//                    child: Center(
//                      child: Hero(
//                        tag: index.toString(),
//                        child: ClipRRect(
//                          borderRadius: BorderRadius.circular(10.0),
//                          child: Container(
//                            height: 220.0,
//                            child: GetNetworkImage(obj.stories_top,index),
//                          ),
////                              child: Image(
////                                image: AssetImage(movies[index].imageUrl),
////                                height: 220.0,
////                                fit: BoxFit.cover,
////                              ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//                Positioned(
//                  left: 30.0,
//                  bottom: 40.0,
//                  child: Container(
//                    width: 250.0,
//                    child: Text(
//                      obj.stories_top[index]["Story_Title"].toUpperCase(),
//                      style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 20.0,
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//        );
//      },
//      future: Get_Latest15_Stories()
//  );
}