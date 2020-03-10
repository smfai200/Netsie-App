import 'package:flutter/material.dart';
import 'Subs/Categories.dart';
import 'Subs/PopularStories.dart';
import 'Subs/LatestStories.dart';
import 'Subs/MovieSelector.dart';
import '../BottomNavigation.dart';

Widget Home(BuildContext context,_pageController,Function callback,Function onclick){
  return Scaffold(
    backgroundColor: Colors.white,
    bottomNavigationBar: BottomNavigation(callback),
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Image(
        image: AssetImage('assets/logos/logo.png'),
      ),
    ),
    body: ListView(
      children: <Widget>[
        Container(
          height: 280.0,

          child: PageView.builder(
            controller: _pageController,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return movieSelector(context,index, _pageController);
            },
          ),
        ),
//        Container(
//            height: 90.0,
//            child: Categories()
//        ),
        SizedBox(height: 20.0),
        LatestStories(onclick),
        SizedBox(height: 10.0),
        PopularStories(onclick),
      ],
    ),
  );
}