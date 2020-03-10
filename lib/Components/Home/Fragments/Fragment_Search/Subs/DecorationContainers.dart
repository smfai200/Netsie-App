import 'package:flutter/material.dart';
import 'QuadCliper.dart';
import 'package:netsieapp/utilities/colors.dart';
import 'CircularContainer.dart';

Widget decorationContainerA(Color primary, double top, double left) {
  return Container();
}

Widget decorationContainerB(Color primary, double top, double left) {
  return Stack(
    children: <Widget>[
      Positioned(
        top: -65,
        right: -65,
        child: CircleAvatar(
          radius: 70,
          backgroundColor: Colors.blue.shade100,
          child: CircleAvatar(radius: 30, backgroundColor: primary),
        ),
      ),
      Positioned(
          top: 35,
          right: -40,
          child: ClipRect(
              clipper: QuadClipper(),
              child: CircleAvatar(
                  backgroundColor: LightColor.lightseeBlue, radius: 40)))
    ],
  );
}

Widget decorationContainerC(Color primary, double top, double left) {
  return Stack(
    children: <Widget>[
      Positioned(
        top: -105,
        left: -35,
        child: CircleAvatar(
          radius: 70,
          backgroundColor: LightColor.orange.withAlpha(100),
        ),
      ),
      Positioned(
          top: 35,
          right: -40,
          child: ClipRect(
              clipper: QuadClipper(),
              child: CircleAvatar(
                  backgroundColor: LightColor.orange, radius: 40))),
      _smallContainer(
        LightColor.yellow,
        35,
        70,
      )
    ],
  );
}

Widget decorationContainerD(Color primary, double top, double left,
    {Color secondary, Color secondaryAccent}) {
  return Stack(
    children: <Widget>[
      Positioned(
        top: top,
        left: left,
        child: CircleAvatar(
          radius: 100,
          backgroundColor: secondary,
        ),
      ),
      _smallContainer(LightColor.yellow, 18, 35, radius: 12),
      Positioned(
        top: 130,
        left: -50,
        child: CircleAvatar(
          radius: 80,
          backgroundColor: primary,
          child: CircleAvatar(radius: 50, backgroundColor: secondaryAccent),
        ),
      ),
      Positioned(
        top: -30,
        right: -40,
        child: circularContainer(80, Colors.transparent,
            borderColor: Colors.white),
      )
    ],
  );
}

Widget decorationContainerE(Color primary, double top, double left,
    {Color secondary}) {
  return Stack(
    children: <Widget>[
      Positioned(
        top: -105,
        left: -35,
        child: CircleAvatar(
          radius: 70,
          backgroundColor: primary.withAlpha(100),
        ),
      ),
      Positioned(
          top: 40,
          right: -25,
          child: ClipRect(
              clipper: QuadClipper(),
              child: CircleAvatar(backgroundColor: primary, radius: 40))),
      Positioned(
          top: 45,
          right: -50,
          child: ClipRect(
              clipper: QuadClipper(),
              child: CircleAvatar(backgroundColor: secondary, radius: 50))),
      _smallContainer(LightColor.yellow, 15, 90, radius: 5)
    ],
  );
}

Widget decorationContainerF(
    Color primary, Color secondary, double top, double left) {
  return Stack(
    children: <Widget>[
      Positioned(
          top: 25,
          right: -20,
          child: RotatedBox(
            quarterTurns: 1,
            child: ClipRect(
                clipper: QuadClipper(),
                child: CircleAvatar(
                    backgroundColor: primary.withAlpha(100), radius: 50)),
          )),
      Positioned(
          top: 34,
          right: -8,
          child: ClipRect(
              clipper: QuadClipper(),
              child: CircleAvatar(
                  backgroundColor: secondary.withAlpha(100), radius: 40))),
      _smallContainer(LightColor.yellow, 15, 90, radius: 5)
    ],
  );
}


Positioned _smallContainer(Color primary, double top, double left,
    {double radius = 10}) {
  return Positioned(
      top: top,
      left: left,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: primary.withAlpha(255),
      ));
}