import 'package:flutter/material.dart';
import 'package:netsieapp/utilities/constants.dart';

profilePosts(context,data) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 200,
    child: ListView.builder(
        itemCount: data["Stories"].length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _numberOfPosts(data["Stories"].length);
          } else if (index == 9) {
            return Container();
//            return _seeMorePosts();
          } else {
            return _profilePost(data["Stories"][index]);
          }
        }),
  );
}

_seeMorePosts() {
  return Padding(
    padding: EdgeInsets.only(top: 40, bottom: 40, left: 10),
    child: Container(
      width: 100,
      height: 110,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          )),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.arrow_forward_ios, color: Colors.black,),
            Text(
              "See more",
              style: TextStyle(fontSize: 16, color: Colors.black),
            )
          ],
        ),
      ),
    ),
  );
}

_profilePost(data) {
  print("img"+ data["Story_Image"].toString());
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Container(
      width: 200,
      height: 110,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              data["Story_Image"],

            )
          ),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child:Padding(
              padding: EdgeInsets.only(top:30,bottom: 30),
              child:Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.grey.withOpacity(0.8),
                ),
                child:Center(
                  child:Text(
                    data["Story_Title"],
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                ))),
      )
    ),
  );
}

_numberOfPosts(length) {
  return Padding(
    padding: EdgeInsets.only(top: 45, bottom: 45, right: 10),
    child: NumberOfPosts(length),
  );
}

Widget NumberOfPosts(length){
  return Container(
    width: 90,
    height: 110,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        )),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Text(
              length.toString(),
              style: TextStyle(fontSize: 40, color: Colors.black),
            )
          ),
          Text(
            "STORIES",
            style: TextStyle(fontSize: 14, color: Colors.black),
          )
        ],
      ),
    ),
  );
}