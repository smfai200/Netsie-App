import 'package:flutter/material.dart';
import 'Fragments/Fragment_Home/MainHome_fragment.dart';
import 'Fragments/Fragment_Search/Search_fragment.dart';
import 'Fragments/Fragment_Profile/Profile_fragment.dart';
import 'Fragments/Fragment_Add/add_fragment.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:netsieapp/API/Home_Requests.dart';
import 'package:zefyr/zefyr.dart';
import 'package:quill_delta/quill_delta.dart';
import 'dart:convert';
import 'package:netsieapp/API/Home_Requests.dart';
import 'package:netsieapp/Components/Story/storydetails_screen.dart';
import 'package:netsieapp/Components/Authentication/login_screen.dart';
import 'package:netsieapp/API/Constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int _page = 0;
  String SearchQuery;
  final SwiperController  _swiperController = SwiperController();
  final int _pageCount = 3;
  int _currentIndex = 0;
  File _image;
  var searchcheck = false;
  ZefyrController controllera;
  FocusNode focusNode;

  @override
  void initState(){
    final document = _loadDocument();
    controllera = ZefyrController(document);
    focusNode = FocusNode();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
    GetSeasonsOfUserStories();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if(_page == 0) {
      return FutureBuilder<List<dynamic>>(
          future: Future.wait([
            Get_Latest15_Stories(),
            Get_All_Categories(),
          ]),
          builder: (context, projectSnap) {
            if ((projectSnap.connectionState == ConnectionState.none &&
                projectSnap.hasData == null) || projectSnap.data == null) {
              //print('project snapshot data is: ${projectSnap.data}');
              return Container();
            }
            return Home(context,_pageController, this.Bottom_Navigation_callback,
                this.ClipOnTap);
        }
      );
    }else if(_page == 1){
      return SearchPage(context,this.searchcheck,this.Bottom_Navigation_callback,this.SearchButton_callback);
    }else if(_page == 2){
      return AddFragment(
                    context,
                    this.Bottom_Navigation_callback,
                    this.Add_Callback,
                    this.ChangeDropdown,
                    this.getImage,
                    this.image_getter,
                    _swiperController,
                    _currentIndex,
                    _pageCount,
                    this.controllera,
                    this.focusNode,
                    this.getText,
                    this.EmptyStateSet,
                    this.ProfileToLogin);
    } else{

      readToken().then((result) {
        print(result);
        if(result == 0){
          this.ProfileToLogin();
        }
      });

      return FutureBuilder<List<dynamic>>(
          future: Future.wait([
            GetProfile(),
          ]),
          builder: (context, projectSnap) {
            print(projectSnap);
            if ((projectSnap.connectionState == ConnectionState.none &&
                projectSnap.hasData == null) && projectSnap.data == null && projectSnap.hasError) {
              //print('project snapshot data is: ${projectSnap.data}');
              return CircularProgressIndicator();
            }

            return ProfileHomePage(context,this.Bottom_Navigation_callback);
          }
      );

    }
  }

  ProfileToLogin(){
    setState(() {
      _page = 0;
    });

    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => LoginScreen()));
  }


  ClipOnTap(list,index){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => StoryDetailsScreen(movieobj: list[index])));
  }

  NotusDocument _loadDocument() {
    final Delta delta = Delta()..insert("Zefyr Quick Start\n");
    return NotusDocument.fromDelta(delta);
  }

  String getText(){
      final contents = controllera.document.toString();
      return contents;
  }

  void EmptyStateSet(){
    setState(() {

    });
  }

  var dp_value="";
  var dp_value1 = "";
  String ChangeDropdown(option,value){
    print(dp_value);
    if(option == "check1"){
      return dp_value.toString();
    }else if(option == "change"){
      setState(() {
        dp_value = value;
        dp_value1 = "";
      });
    }else if(option == "change1"){
      setState(() {
        dp_value1 = value;
        dp_value = "";
      });
    }else if(option == "check2"){
      return dp_value1;
    }
  }

  void Bottom_Navigation_callback(int index) {
//    print("page" +this._page.toString());
//    print(index);
//
//    if(this._page == 1 && index == 0){
//      Navigator.pop(context);
//    }else {
      print(index);
      setState(() {
        this._page = index;
      });
//    }
  }


  void Add_Callback(index){
    setState(() {
      _currentIndex = index;
    });
  }


  void SearchButton_callback(searchQuery) {
    print(searchQuery);
    GetStoryByTitle(searchQuery);
    GetSeasonByTitle(searchQuery);
    GetEpisodeByTitle(searchQuery);

    print("Send Request");

    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        searchcheck = true;
      });
    });

  }


  File image_getter(){
    return this._image;
  }

  Future getImage() async {
    //var image = await ImagePicker.pickImage(source: ImageSource.camera);
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      this._image = image;
    });
  }


}
