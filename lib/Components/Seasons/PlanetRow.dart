import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:netsieapp/utilities/Routes.dart';
import 'package:netsieapp/utilities/Theme.dart' as Theme;
import 'package:netsieapp/models/Planet.dart';
import 'package:netsieapp/widgets/content_scroll.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PlanetRow extends StatelessWidget {

  final Map season;
  Function callback;
  int index;

  PlanetRow(this.season,this.callback,this.index){
    var manager = new DefaultCacheManager();
    manager.emptyCache(); //clears all data in cache.
  }

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      alignment: new FractionalOffset(0.0, 0.5),
      margin: const EdgeInsets.only(left: 24.0),
      child: new Hero(
        tag: 'planet-icon-${season["id"]}',
        child: Container(
          height: Theme.Dimens.planetHeight,
          width: Theme.Dimens.planetWidth,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child:GetSingle_NetworkImage(season["Season_Image"])
          ),
        )
      ),
    );

    final planetCard = new Container(
      margin: const EdgeInsets.only(left: 72.0, right: 24.0),
      decoration: new BoxDecoration(
        color: Theme.Colors.planetCard,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(color: Colors.black,
            blurRadius: 3.0,
            offset: new Offset(0.0, 0.0))
        ],
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(season["Season_Title"], style: Theme.TextStyles.planetTitle),
            new Text("Posted on: "+season["CreateDate"].substring(0,10), style: Theme.TextStyles.planetLocation),
            new Container(
              color: const Color(0xFF00C6FF),
              width: 24.0,
              height: 1.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0)
            ),
            new Row(
              children: <Widget>[
                new Icon(Icons.movie, size: 14.0,
                  color: Theme.Colors.planetDistance),
                new Text(
                  "10", style: Theme.TextStyles.planetDistance),
                new Container(width: 24.0),
//                new Icon(Icons.flight_land, size: 14.0,
//                  color: Theme.Colors.planetDistance),
//                new Text(
//                  planet.gravity, style: Theme.TextStyles.planetDistance),
              ],
            )
          ],
        ),
      ),
    );

    return new Column(
        children:<Widget>[
          Container(
              height: 120.0,
              margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: new FlatButton(
                onPressed: (){
                  print("Test");
                  this.callback(season["id"]);
                },//_navigateTo(context, planet.id),

                child: new Stack(
                  children: <Widget>[
                    planetCard,
                    planetThumbnail,
                  ],
                ),
              ),
            )
      ]
    );
  }

//  _navigateTo(context, String id) {
//    Routes.navigateTo(
//      context,
//      '/detail/${planet.id}',
//      transition: TransitionType.fadeIn
//    );
//  }
}

