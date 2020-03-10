import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Genre extends StatefulWidget{

  @override
  _GenreState createState() => _GenreState();
}

class _GenreState extends State<Genre> {

  ScrollController controller = ScrollController();
  List items = List();
  bool loading = true;
  int page = 1;
  bool pagi = false;
  bool showListenerFlag = true;
  bool loadMore = true;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Test ABC"),
      ),
//      body: loading
//          ? Center(
//        child: CircularProgressIndicator(),
//      )
//          :
        body:ListView(
        controller: controller,
        children: <Widget>[
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ListItem(),
              );
            },
          ),
          SizedBox(height: 10,),


          pagi
              ?Container(
            height: 80,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
              :SizedBox(),
        ],
      ),
    );
  }


  Widget ListItem(){
    return InkWell(
      onTap: () {
      },
      child: Container(
        height: 150,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              elevation: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Hero(
                  tag: "ImageTag",
                  child:Image.asset(
                      "assets/images/bike.png",
                      width: 100,
                      height: 150

                  )
//                  child: CachedNetworkImage(
//                    imageUrl: "$img",
//                    placeholder: (context, url) => Container(
//                      height: 150,
//                      width: 100,
//                      child: Center(
//                        child: CircularProgressIndicator(),
//                      ),
//                    ),
//                    errorWidget: (context, url, error) => Image.asset(
//                      "assets/images/place.png",
//                      fit: BoxFit.cover,
//                      height: 150,
//                      width: 100,
//                    ),
//                    fit: BoxFit.cover,
//                    height: 150,
//                    width: 100,
//                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: "TestTag",
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        "${"ALPHa".replaceAll(r"\", "")}",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.title.color,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Hero(
                    tag: "AuthorTag",
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        "Author",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "sssssssssssss"
                        .replaceAll(r"\n", "\n\n")
                        .replaceAll(r"\r", "")
                        .replaceAll(r"\'", "'"),
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).textTheme.caption.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
