import 'package:netsieapp/API/Constants.dart';

class Story_Model{
  static final _controller = Story_Model._internal();
  Story_Model._internal();

  factory Story_Model() {
    return _controller;
  }

  int id;
  String Title;
  String Description;
  String Image_Url;
  String Slug;
  bool IsActive = true;
  String categoryid;
  List<dynamic> storylist;
  List<dynamic> stories_top = List<Map>();
  List<dynamic> stories_latest = List<Map>();
  List<dynamic> stories_popular = List<Map>();
  List<dynamic> search_storylist = List<Map>();
  Map NewStory = Map();
  int i;

  SetStoryList(storylist){
    if(this.storylist == null) {
      this.storylist = storylist;
      SetHomeScreenLists();
    }
  }

  SetHomeScreenLists(){
    for(i=0; i<this.storylist.length; i++){
      this.storylist[i]["Story_Image"] = API_Baseurl+"/"+this.storylist[i]["Story_Image"];
      if(i<4){
        this.stories_top.add(this.storylist[i]);
      }else if(i>=4 && i<=8){
        this.stories_latest.add(this.storylist[i]);
      }else{
        this.stories_popular.add(this.storylist[i]);
      }
    }

    print(this.stories_popular.length);
  }

  SetStory_Search(storylist){
    this.search_storylist = storylist;
    for(i=0; i<this.search_storylist.length; i++) {
      this.search_storylist[i]["Story_Image"] = API_Baseurl + "/" + this.search_storylist[i]["Story_Image"];
    }
  }

  GetStory_SearchByFK(id){
    for(i=0; i<this.search_storylist.length; i++) {
      if(this.search_storylist[i]["id"] == id){
        return this.search_storylist[i];
      }
    }
  }

}