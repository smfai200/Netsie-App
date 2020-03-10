import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netsieapp/utilities/constants.dart';
import 'package:netsieapp/Controllers/Login_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:netsieapp/models/API/Profile.dart';
import 'package:netsieapp/models/API/Season.dart';
import 'package:netsieapp/API/Story.dart';

class AddSeason_New extends StatelessWidget{

  Function dropdown;
  Function swipe;
  Function getimage;
  Function imagegetter;
  AddSeason_New({this.dropdown,this.swipe,this.getimage,this.imagegetter});

  bool _rememberMe = false;
  bool validate = true;
  bool validate1 = true;
  final _controller = LoginController();
  var _Model = Season_Model();

  File avatarImageFile, backgroundImageFile;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Season Title'.toUpperCase(),
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(

            onChanged: (text){
              _Model.NewSeason["Season_Title"] = text;
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

  var dp_check = false;
  Widget _buildCountryTF() {
    var items = this.buildDropdownMenuItems();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Season of Story'.toUpperCase(),
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: DropdownButton(
            value: dropdown("","")=="" ? items[0].value : dropdown("",""),
            items: items,
            onChanged: (text){
              _Model.NewSeason["Fk_Story"] = Profile_Model().getUserStoryIdByTitle(text);
              print("id: "+_Model.NewSeason["Fk_Story"].toString());
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

  List<DropdownMenuItem> buildDropdownMenuItems() {
    var Cat_Model = Profile_Model();
    List<DropdownMenuItem> items = List();
    for (var cat in Cat_Model.story_labels_unique) {
      items.add(
        DropdownMenuItem(
          value: cat,
          child: Text(cat),
        ),
      );
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
          Map result = await AddSeason(this.imagegetter());
          if(result.containsKey("id")){
            _showcontent(context);
          }
//          if(result == true){
//            swipe(1);
//          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'PUBLISH SEASON',
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
                new Text('Season Added Successfully, Swipe Left to Add Episode!'),
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
