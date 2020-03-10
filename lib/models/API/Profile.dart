import 'package:netsieapp/API/Constants.dart';


class Profile_Model{
  static final _controller = Profile_Model._internal();
  Profile_Model._internal();
  Map ProfileData = Map();
  List<dynamic> UserStories;
  List<String> storylabels = List<String>();
  List<dynamic> story_labels_unique;
  List<dynamic> Story_seasonlist;
  List<dynamic> Story_seasonlist1;
  Map Profile_StoryAndSeason = Map();
  List<String> userstory_labels_unique = List<String>();
  int i;


  factory Profile_Model() {
    return _controller;
  }

  setProfileData(profiledata,stories){
    this.ProfileData = profiledata;
    this.ProfileData["User_photo"] = API_Baseurl+'/'+this.ProfileData["User_photo"];

    this.UserStories = stories;
    for(i=0; i<this.UserStories.length; i++) {
      this.storylabels.add(this.UserStories[i]["Story_Title"].toString());
      this.UserStories[i]["Story_Image"] = API_Baseurl + "/" + this.UserStories[i]["Story_Image"];
    }
    this.story_labels_unique = this.storylabels.toSet().toList();
  }

  getUserStoryIdByTitle(title){
    for (var name in this.UserStories){
      if(name["Story_Title"].toString().replaceAll("\"", "") == title){
        return name["id"];
      }
    }
    return "";
  }

  getSeasonIdByTitle(title){
    for (var cat in this.Story_seasonlist) {
      try{
        for (var singlecat in cat["Seasons"]) {
          if(singlecat["Season_Title"] == title){
            return singlecat["id"];
          }
        }

      }catch(e){

      }
    }
  }

  setStoriesWithSeasons(listofdata){
    this.Story_seasonlist = listofdata;

    for (var cat in this.Story_seasonlist) {
      try{
        for (var singlecat in cat["Seasons"]) {

        }
        this.Story_seasonlist1.add(cat);
      }catch(e){

      }
      }

  }

}