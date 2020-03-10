import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Favorites",
            ),
          ),
          body: GridView.builder(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            shrinkWrap: true,
            itemCount: 2,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 200/340,
            ),
            itemBuilder: (BuildContext context, int index) {
//              Entry entry = Entry.fromJson(favoritesProvider.posts[index]["item"]);
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: BookItem(),
              );
            },
          ),
        );
  }

  Widget BookItem(){
    return InkWell(
      onTap: (){

      },
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: Hero(
              tag: "ImageTag",
              child: Image.asset("assets/images/bike.png"),
            ),
          ),

          SizedBox(height: 5,),

          Hero(
            tag: "Title",
            child: Text(
              "${"Title".replaceAll(r"\", "")}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
