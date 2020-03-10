import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  Function callback;

  BottomNavigation(this.callback);

  @override
  _BottomNavigation createState() => new _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation>  {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 50.0,
      items: <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.search, size: 30),
        Icon(Icons.add_circle, size: 30),
        Icon(Icons.person, size: 30),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Color(0xFF383838),
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) {
        this.widget.callback(index);
      },
    );
  }

}