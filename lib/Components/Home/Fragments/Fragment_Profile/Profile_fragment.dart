import 'package:flutter/material.dart';
import 'Subs/profileactions.dart';
import 'Subs/profileinfo.dart';
import 'Subs/profileposts.dart';
import 'Subs/toolbar.dart';
import '../BottomNavigation.dart';
import 'package:netsieapp/API/Home_Requests.dart';
import 'package:netsieapp/API/Constants.dart';
import 'package:netsieapp/models/API/Profile.dart';



Widget ProfileHomePage(context,Function callback){
  var obj = Profile_Model();

  return Scaffold(
      bottomNavigationBar: BottomNavigation(callback),
      body: SafeArea(
        top: true,
        child: Material(
          color: Colors.grey,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: obj.ProfileData["User_photo"]==null ? Image.asset(
                  "asset/images/spiderman.jpg",
                  fit: BoxFit.cover,
                ):Image.network(
                  obj.ProfileData["User_photo"],
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x0041444B),
                          Color(0x6041444B),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  )),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Expanded(
                      child: _body(context,obj.ProfileData),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
//  return FutureBuilder(
//      future: GetProfile(),
//      builder: (context, projectSnap){
//
//      readToken().then((result) {
//        print(result);
//        if(result == 0){
//          Logincall();
//        }
//      });
//
//      if ((projectSnap.connectionState == ConnectionState.none &&
//          projectSnap.hasData == null) || projectSnap.data == null) {
//        return Center(child:CircularProgressIndicator());
//      }
//
//
//
//      return Scaffold(
//        bottomNavigationBar: BottomNavigation(callback),
//        body: SafeArea(
//          top: true,
//          child: Material(
//            color: Colors.grey,
//            child: Stack(
//              children: <Widget>[
//                Positioned(
//                  top: 0,
//                  bottom: 0,
//                  left: 0,
//                  right: 0,
//                  child: Image.network(
//                    projectSnap.data["User_photo"],
//                    fit: BoxFit.cover,
//                  ),
//                ),
//                Positioned(
//                    top: 0,
//                    bottom: 0,
//                    left: 0,
//                    right: 0,
//                    child: Container(
//                      decoration: BoxDecoration(
//                        gradient: LinearGradient(
//                          colors: [
//                            Color(0x0041444B),
//                            Color(0x6041444B),
//                          ],
//                          begin: Alignment.topCenter,
//                          end: Alignment.bottomCenter,
//                        ),
//                      ),
//                    )),
//                Positioned(
//                  top: 0,
//                  bottom: 0,
//                  left: 0,
//                  right: 0,
//                  child: Column(
//                    mainAxisSize: MainAxisSize.max,
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//
//                      Expanded(
//                        child: _body(context,projectSnap.data),
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ));
//  });
}

_body(context,data) {
  if(data == null || data["Stories"] == null){
    return CircularProgressIndicator();
  }
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: profileInfo(data["User_FullName"],data["User_Bio"]),
        ),
        profilePosts(context,data),
        profileActionsAndInfo(context),
      ],
    ),
  );
}

