import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netsieapp/utilities/constants.dart';
import 'dart:io';
import 'package:netsieapp/models/API/Episode.dart';
import 'package:netsieapp/widgets/content_scroll.dart';
import 'package:netsieapp/API/Constants.dart';

class ReadEpisodeScreen extends StatelessWidget{

  var Episode;
  ReadEpisodeScreen({this.Episode}){
    print(this.Episode.toString());
  }


  File avatarImageFile, backgroundImageFile;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          Episode["Episode_Title"].toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child:Text(
            Episode["Episode_TextStory"].toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 25,
              fontFamily: 'OpenSans',
            ),
          )
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  var dp_check = false;
  Widget _buildCountryTF() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Story Category'.toUpperCase(),
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,

        ),
      ],
    );
  }


  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {

        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'PUBLISH STORY',
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
                            (Episode["Episode_Image"] == null)
                                ? new Image.asset(
                              "assets/images/empty.png",
                              width: double.infinity,
                              height: 150.0,
                              fit: BoxFit.cover,
                            )
                                : Container(
                              height: 150,
                              width:300,
                              child:Image.network(API_Baseurl+"/"+Episode["Episode_Image"],fit: BoxFit.cover)
                            ),
//                            new Image.asset(
//                              "",
//                              width: double.infinity,
//                              height: 150.0,
//                              fit: BoxFit.cover,
//                            ),

                            // Button change background
                            new Positioned(
                              child: new Material(
                                child: new IconButton(
                                  icon: Icon(Icons.arrow_back),
                                  onPressed: () => print(""),
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
