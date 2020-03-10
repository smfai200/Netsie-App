import 'package:flutter/material.dart';
import 'package:netsieapp/widgets/circular_clipper.dart';
import 'package:netsieapp/widgets/content_scroll.dart';
import 'package:netsieapp/models/movie_model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:netsieapp/Components/Seasons/seasonlist_screen.dart';

class StoryDetailsScreen extends StatefulWidget {
  final Movie movie;

  StoryDetailsScreen({this.movie});

  @override
  _StoryDetailsScreenState createState() => _StoryDetailsScreenState();
}

class _StoryDetailsScreenState extends State<StoryDetailsScreen> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Build_BottomNavigation(),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
//          Build_BottomNavigationState(),
          Stack(
            children: <Widget>[
              Build_FeatureImageWithCurve(),
              Build_TopBarOnImage(),
              Build_PlayButtonOnImage(),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Build_TitleText(),
                SizedBox(height: 10.0),
                Build_CategoryText(),
                SizedBox(height: 12.0),
                Build_RatingStars(),
                SizedBox(height: 15.0),
                Build_CreationInfo(),
                SizedBox(height: 25.0),
                Build_Overview(),
              ],
            ),
          ),
          Build_ScreenshotsArea(),
        ],
      ),
    );
  }


  Widget Build_FeatureImageWithCurve() {
    return Container(
      transform: Matrix4.translationValues(0.0, -50.0, 0.0),
      child: Hero(
        tag: widget.movie.imageUrl,
        child: ClipShadowPath(
          clipper: CircularClipper(),
          shadow: Shadow(blurRadius: 20.0),
          child: Image(
            height: 400.0,
            width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage(widget.movie.imageUrl),
          ),
        ),
      ),
    );
  }

  Widget Build_TopBarOnImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          padding: EdgeInsets.only(left: 30.0),
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.black,
        ),
        Image(
          image: AssetImage('assets/images/netflix_logo.png'),
          height: 60.0,
          width: 150.0,
        ),
        IconButton(
          padding: EdgeInsets.only(left: 30.0),
          onPressed: () => print('Add to Favorites'),
          icon: Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget Build_PlayButtonOnImage() {
    return Positioned.fill(
      bottom: 10.0,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RawMaterialButton(
          padding: EdgeInsets.all(10.0),
          elevation: 12.0,
          onPressed: () => print('Play Video'),
          shape: CircleBorder(),
          fillColor: Colors.white,
          child: Icon(
            Icons.play_arrow,
            size: 60.0,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget Build_TitleText() {
    return Text(
      widget.movie.title.toUpperCase(),
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget Build_CategoryText() {
    return Text(
      widget.movie.categories,
      style: TextStyle(
        color: Colors.black54,
        fontSize: 16.0,
      ),
    );
  }

  Widget Build_RatingStars() {
    return Text(
      '⭐ ⭐ ⭐ ⭐',
      style: TextStyle(fontSize: 25.0),
    );
  }

  Widget Build_CreationInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              'Year',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              widget.movie.year.toString(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              'Country',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              widget.movie.country.toUpperCase(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              'Length',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              '${widget.movie.length} min',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget Build_Overview() {
    return Container(
      height: 120.0,
      child: SingleChildScrollView(
        child: Text(
          widget.movie.description,
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget Build_ScreenshotsArea() {
    return ContentScroll(
      images: widget.movie.screenshots,
      title: 'Screenshots',
      imageHeight: 200.0,
      imageWidth: 250.0,
    );
  }

//  Widget Build_BottomNavigationState() {
//    return Container(
//          color: Colors.blueAccent,
//          child: Center(
//            child: Column(
//              children: <Widget>[
//                RaisedButton(
//                  onPressed: () {
//                    final CurvedNavigationBarState navBarState =
//                        _bottomNavigationKey.currentState;
//                    navBarState.setPage(1);
//                  },
//                )
//              ],
//            ),
//          ),
//        );
//  }

  Widget Build_BottomNavigation() {
    return CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
          Icon(Icons.call_split, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//              builder: (_) => ,
//            ),
//          );
//          setState(() {
//            print("Page Changed: " + index.toString());
//            _page = index;
//          });
        },
    );
  }
}
