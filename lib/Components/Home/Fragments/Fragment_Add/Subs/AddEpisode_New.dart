import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netsieapp/models/API/Episode.dart';
import 'package:netsieapp/models/API/Season.dart';
import 'package:netsieapp/utilities/constants.dart';
import 'package:netsieapp/Controllers/Login_controller.dart';
import 'package:netsieapp/Components/Home/home_screen.dart';
import 'package:netsieapp/API/Story.dart';
import 'package:zefyr/zefyr.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:netsieapp/models/API/Profile.dart';
import 'package:netsieapp/API/Home_Requests.dart';

class AddEpisode_New extends StatelessWidget{

  Function dropdown;
  Function swipe;
  Function getimage;
  Function imagegetter;
  bool _rememberMe = false;
  bool validate = true;
  bool validate1 = true;
  final _controller = LoginController();
  var _Model = Episode_Model();
  ZefyrController controllera;
  FocusNode focusNode;
  Function getRichText;
  Function emptystate;
  var Storyid;
  var SeasonModel = Season_Model();

  AddEpisode_New({this.dropdown,this.swipe,this.getimage,this.imagegetter,
    this.controllera,this.focusNode,this.getRichText,this.emptystate}){
    _Model.NewEpisode["Storyid"];
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Episode Title'.toUpperCase(),
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(

            onChanged: (text){
              _Model.NewEpisode["Episode_Title"] = text;
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              suffixIcon: validate==true ? Icon(Icons.error, color: Colors.white,size:0):Icon(Icons.error, color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: "Tape a Tale",
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Episode Text Story'.toUpperCase(),
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 300.0,
          child: ZefyrScaffold(
            child: ZefyrEditor(
              padding: EdgeInsets.all(0),
              controller: this.controllera,
              focusNode: this.focusNode,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStoryTF() {
    var items = this.buildDropdownMenuItemsStory();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Select Story'.toUpperCase(),
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: DropdownButton(
            value: dropdown("check1","")=="" ? items[0].value : dropdown("check1",""),
            items: items,
            onChanged: (text) async{
              _Model.NewEpisode["Storyid"] = Profile_Model().getUserStoryIdByTitle(text);
              print("Movie Value:"+_Model.NewEpisode["Storyid"].toString());
              dropdown("change",text);
            },
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'OpenSans',
            ),

          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem> buildDropdownMenuItemsStory() {
    var Cat_Model = Profile_Model();
    List<DropdownMenuItem> items = List();


    for (var cat in Cat_Model.Story_seasonlist) {
      try {
          for(var scat in cat["Seasons"]) {

          }
          items.add(
            DropdownMenuItem(
              value: cat["Story_Title"].toString().replaceAll("\"", ""),
              child: Text(cat["Story_Title"].toString().replaceAll("\"", "")),
            ),
          );
      }catch(e){

      }
    }
    return items;
  }

  var dp_check = false;
  Widget _buildCountryTF() {
      var Cat_Model = Profile_Model();
      List<DropdownMenuItem> items;
      items = this.buildDropdownMenuItems(_Model.NewEpisode["Storyid"]);
      print(items);
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select Season'.toUpperCase(),
              style: kLabelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: DropdownButton(
                value: dropdown("check2", "") == "" ? items[0].value : dropdown(
                    "check2", ""),
                items: items,
                onChanged: (text) {
                  _Model.NewEpisode["Episode_Season"] = Profile_Model().getSeasonIdByTitle(text);
                  dropdown("change1", text);
                },
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'OpenSans',
                ),

              ),
            )
          ]);
  }

  List<DropdownMenuItem> buildDropdownMenuItems(id) {
    List<DropdownMenuItem> items = List();
    var Cat_Model = Profile_Model();
    if(id == null){
      for (var cat in Cat_Model.Story_seasonlist) {
        try{
          for (var singlecat in cat["Seasons"]) {
            items.add(
              DropdownMenuItem(
                value: singlecat["Season_Title"],
                child: Text(singlecat["Season_Title"]),
              ),
            );
          }
        }catch(e){

        }
      }
    }else{
      for (var cat in Cat_Model.Story_seasonlist) {
        if (cat["id"] == id) {
          try{
            for (var singlecat in cat["Seasons"]) {
              items.add(
                DropdownMenuItem(
                  value: singlecat["Season_Title"],
                  child: Text(singlecat["Season_Title"]),
                ),
              );
            }
          }catch(e){

          }
        }
      }
    }
    return items;
  }

  Widget _buildLoginBtn(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async{
          _Model.NewEpisode["Episode_TextStory"] = this.getRichText();
          Map result = await AddEpisode(this.imagegetter());
          _showcontent(context);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => HomeScreen()));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'PUBLISH EPISODE',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  void _showcontent(context) {
    showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Message'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('Story Added Successfully, Swipe to Add Season!'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[

              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 70.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Stack(
                          children: <Widget>[
                            // Background
                            (this.imagegetter() == null)
                                ? new Image.asset(
                              "assets/images/empty.png",
                              width: double.infinity,
                              height: 150.0,
                              fit: BoxFit.cover,
                            )
                                : new Image.file(
                              this.imagegetter(),
                              width: double.infinity,
                              height: 150.0,
                              fit: BoxFit.cover,
                            ),

                            // Button change background
                            new Positioned(
                              child: new Material(
                                child: new IconButton(
                                  icon: Icon(Icons.image),
                                  onPressed: () => this.getimage(),
                                  padding: new EdgeInsets.all(0.0),
                                  highlightColor: Colors.black,
                                  iconSize: 30.0,
                                ),
                                borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              right: 5.0,
                              top: 5.0,
                            )]),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      SizedBox(height: 30.0),
                      _buildStoryTF(),
                      SizedBox(height: 30.0),
                      _buildCountryTF(),
                      _buildLoginBtn(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
