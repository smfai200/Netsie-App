import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netsieapp/utilities/constants.dart';
import 'package:netsieapp/Components/Authentication/signup_screen.dart';
import 'package:netsieapp/Components/Home/home_screen.dart';
import 'package:netsieapp/Controllers/Login_controller.dart';
import 'package:netsieapp/API/Login_Request.dart' as API;
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:netsieapp/models/API/Profile.dart';
import 'package:netsieapp/API/AddRequests.dart';

//class EditProfileStateless extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(
//          "EDIT PROFILE",
//          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//        ),
//        centerTitle: true,
//      ),
//      body: new EditProfile(),
//    );
//  }
//}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _rememberMe = false;
  bool validate = true;
  bool validate1 = true;
  final _controller = LoginController();
  var ProfileData = Profile_Model();

  File avatarImageFile, backgroundImageFile;

  Future getImage(bool isAvatar) async {
    var result = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (isAvatar) {
        avatarImageFile = result;
      } else {
        backgroundImageFile = result;
      }
    });
  }


  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Full Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(

            onChanged: (text){
              ProfileData.ProfileData["User_FullName"] = text;
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
              hintText: ProfileData.ProfileData["User_FullName"].toString().replaceAll("\"", ""),
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
          'Bio',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            maxLines: 4,
            onChanged: (text){
              ProfileData.ProfileData["User_Bio"] = text;
            },
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              suffixIcon: validate1==true ? Icon(Icons.error, color: Colors.white,size:0):Icon(Icons.error, color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 20.0),
              prefixIcon: Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
              hintText: ProfileData.ProfileData["User_Bio"].toString().replaceAll("\"", ""),
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCountryTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Country',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            maxLines: 4,
            onChanged: (text){
              ProfileData.ProfileData["User_Country"] = text;
            },
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              suffixIcon: validate1==true ? Icon(Icons.error, color: Colors.white,size:0):Icon(Icons.error, color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 20.0),
              prefixIcon: Icon(
                Icons.flag,
                color: Colors.white,
              ),
              hintText: ProfileData.ProfileData["User_Country"].toString().replaceAll("\"", ""),
              hintStyle: kHintTextStyle,
            ),
          ),
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
        onPressed: () async{
         var result = await UpdateProfile(backgroundImageFile);
         if(result == true){
           Navigator.of(context).push(MaterialPageRoute(
               builder: (_) => HomeScreen()));
         }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'UPDATE PROFILE',
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
                    vertical: 30.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Stack(
                      children: <Widget>[
                          // Background
                          (backgroundImageFile == null)
                          ? new Image.network(
                        ProfileData.ProfileData["User_photo"],
                        width: double.infinity,
                        height: 150.0,
                        fit: BoxFit.cover,
                      )
                          : new Image.file(
                        backgroundImageFile,
                        width: double.infinity,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),

                      // Button change background
                      new Positioned(
                        child: new Material(
                          child: new IconButton(
                            icon: Icon(Icons.image),
                            onPressed: () => getImage(false),
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
                      _buildCountryTF(),
                      _buildLoginBtn(),
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
