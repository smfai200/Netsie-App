import 'package:flutter/material.dart';
import 'package:netsieapp/widgets/circular_clipper.dart';
import 'package:netsieapp/widgets/content_scroll.dart';
import 'package:netsieapp/models/movie_model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:netsieapp/Components/Seasons/seasonlist_screen.dart';
import 'package:netsieapp/Components/Seasons/PlanetRow.dart';
import 'package:netsieapp/models/Planets.dart';
import 'package:netsieapp/models/lesson.dart';
import 'package:netsieapp/Components/Episodes/readepisode_screen.dart';
import 'package:netsieapp/models/API/Story.dart';
import 'package:netsieapp/models/API/Category.dart';
import 'package:netsieapp/widgets/content_scroll.dart';
import 'package:netsieapp/API/Home_Requests.dart';
import 'package:netsieapp/models/API/Season.dart';
import 'package:netsieapp/models/API/Episode.dart';
import 'package:netsieapp/utilities/Theme.dart' as Theme;

class StoryDetailsScreen extends StatefulWidget {
  Map movieobj;


  StoryDetailsScreen({this.movieobj});

  @override
  _StoryDetailsScreenState createState() => _StoryDetailsScreenState();
}

class _StoryDetailsScreenState extends State<StoryDetailsScreen> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  int _page = 0;
  List lessons;
  var Seasons_Model = Season_Model();
  PageController _pageController;
  int seasonid = 1;

  @override
  void initState() {
    lessons = getLessons();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if(_page == 0) {
      return Scaffold(
          bottomNavigationBar: Build_BottomNavigation(),
          backgroundColor: Colors.white,
          body: Body_Fragment0()
      );
    }else if(_page == 1){
      return Scaffold(
          bottomNavigationBar: Build_BottomNavigation(),
          backgroundColor: Colors.white,
          body: Body_Fragment1()
      );
    }else if(_page == 2){
      return Scaffold(
          resizeToAvoidBottomPadding: false,
          bottomNavigationBar: Build_BottomNavigation(),
          backgroundColor: Colors.white,
          body: Body_Fragment2()
      );
    }
  }

  Widget Body_Fragment2(){
    var Episodes_Model = Episode_Model();
    ListTile makeListTile(Map Episode) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.movie, color: Colors.white),
      ),
      title: Text(
        Episode["Episode_Title"],
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
//          Expanded(
//              flex: 1,
//              child: Container(
//                // tag: 'hero',
//                child: LinearProgressIndicator(
//                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
//                    value: lesson.indicatorValue,
//                    valueColor: AlwaysStoppedAnimation(Colors.green)),
//              )),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Text(Episode["Episode_TextStory"].substring(0,30)+" ...",
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ReadEpisodeScreen(Episode: Episode),
          ),
        );
      },
    );

    Card makeCard(Map episode) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
              child: makeListTile(episode),
        ),
      );

    final makeBody = SingleChildScrollView(
      child: Column(
        children:[
          Container(
            child:Padding(
              padding: EdgeInsets.only(top:50),
              child:SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:Row(
                    children: <Widget>[
                      for ( var season in Seasons_Model.seasonlist)Build_PlayButtonSingle(season["id"],season["Season_Image"])
                    ],
              ),
              ),
            ),
          ),
            Container(
//              decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
              child: Episodes_Model.episodelength > 0 ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: Episodes_Model.episodelength,
                itemBuilder: (BuildContext context, int index) {
                  return makeCard(Episodes_Model.episodelist[index]);
                },
              ):Empty(),
            ),
      ]
     )
    );

    return FutureBuilder(
      builder: (context, projectSnap) {
        if ((projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) && projectSnap.data == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Center(
            child:CircularProgressIndicator(),
          );
        }

        print("Episode Length: " +this.seasonid.toString()+Episodes_Model.episodelength.toString());

        if(Episodes_Model.episodelist == null || Episodes_Model.episodelist == 0){
          return Empty();
        }

        return makeBody;
      },
      future: GetEpisodes_OfSeason(this.seasonid),
    );
  }

  void setstate_page(index){
    setState(() {
      this.seasonid = index;
    });
    final CurvedNavigationBarState navBarState =
        _bottomNavigationKey.currentState;
    navBarState.setPage(2);

//    setState(() {
//      _page = 2;
//    });
  }

  void setstate_page1(){
    final CurvedNavigationBarState navBarState =
        _bottomNavigationKey.currentState;
    navBarState.setPage(1);
//    setState(() {
//      _page = 2;
//    });
  }

  Widget Body_Fragment1(){
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new Container(
            child: new ListView.builder(
              itemExtent: 160.0,
              itemCount: Seasons_Model.seasonlength,
              itemBuilder: (_, index) => new PlanetRow(Seasons_Model.seasonlist[index],this.setstate_page,index),
            ),
          ),
        )
      ],
    );
  }

  Widget Body_Fragment0(){
    return ListView(
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
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 0.0),
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
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child:Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20
                  ))
                ),
                Build_Overview(),
            ],
          ),
        ),
//        Build_ScreenshotsArea(),
      ],
    );
  }

  Widget Build_FeatureImageWithCurve() {
    return Container(
      transform: Matrix4.translationValues(0.0, -50.0, 0.0),
      child: Hero(
        tag: widget.movieobj["id"].toString(),
        child: ClipShadowPath(
          clipper: CircularClipper(),
          shadow: Shadow(blurRadius: 20.0),
          child: Container(
              height: 400.0,
              width: double.infinity,
              child:GetSingle_NetworkImage(widget.movieobj["Story_Image"])
//            Image(
//              height: 400.0,
//              width: double.infinity,
//              fit: BoxFit.cover,
//              image: AssetImage(widget.movie.imageUrl),
//            )
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
  int testindex = 0;
  Widget Build_PlayButtonSingle(id,image){
    this.testindex = this.testindex+1;
    return Container(
        alignment: new FractionalOffset(0.0, 0.2),
        margin: const EdgeInsets.only(left: 8.0),
        child: new Hero(
            tag: 'planet-icon-${this.testindex}',
            child: Container(
              height: Theme.Dimens.planetHeight,
              width: Theme.Dimens.planetWidth,
              child: InkWell(
//                  behavior:HitTestBehavior.translucent,
                  onTap: (){
                  print("Activated");
                  setState(() {
                    this.seasonid = id;
                  });
                },
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child:GetSingle_NetworkImage(image)
              ),
            )
        ),
      ));
  }

  Widget Build_PlayButtonOnImage() {
    return Positioned.fill(
      bottom: 10.0,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RawMaterialButton(
          padding: EdgeInsets.all(10.0),
          elevation: 12.0,
          onPressed: () => this.setstate_page1(),
          shape: CircleBorder(),
          fillColor: Colors.white,
          child: Container(
            width: 160,
            height:115,
            child:Center(
                child:Text(
                    "View Seasons",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                )
            )
          ),
        ),
      ),
    );
  }

  Widget Build_TitleText() {
    return Text(
      widget.movieobj["Story_Title"].toUpperCase(),
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget Build_CategoryText() {
    var _ModelCat = Category_Model();
    return Text(
      _ModelCat.GetCategoryTitleById(widget.movieobj["Story_Category"]),
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
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }

     if(Seasons_Model.seasonlist == null || Seasons_Model.seasonlength == 0){
       return Empty();
     }

     this.seasonid = Seasons_Model.seasonlist[0]["id"];

     return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              'Posted On',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              widget.movieobj["CreateDate"].substring(0,10).toString(),
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
              'Seasons',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              Seasons_Model.seasonlength.toString().toUpperCase(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
      },
      future: GetSeasons_OfStory(widget.movieobj["id"]),
    );
  }

  Widget Build_Overview() {
    return Container(
      height: 120.0,
      child: SingleChildScrollView(
        child: Text(
          widget.movieobj["Story_Description"],
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget Build_ScreenshotsArea() {
    return ContentScroll(
//      images: widget.movie.screenshots,
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

  Widget Empty(){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            "assets/images/empty.png",
            height: 300,
            width: 300,
          ),
          Text(
            "Nothing is here",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget Build_BottomNavigation() {
    return CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.amberAccent,
        backgroundColor: Color(0xFF383838),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
        setState(() {
            print("Page Changed: " + index.toString());
            _page = index;
        });
        },
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "Introduction to Driving",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 20,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Observation at Junctions",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Reverse parallel Parking",
        level: "Intermidiate",
        indicatorValue: 0.66,
        price: 30,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Reversing around the corner",
        level: "Intermidiate",
        indicatorValue: 0.66,
        price: 30,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Incorrect Use of Signal",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Engine Challenges",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Self Driving Car",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.  ")
  ];
}
