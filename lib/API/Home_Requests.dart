import 'package:http/http.dart';
import 'package:netsieapp/API/Constants.dart';
import 'dart:convert';
import 'package:netsieapp/models/API/Story.dart';
import 'package:netsieapp/models/API/Category.dart';
import 'package:netsieapp/models/API/Season.dart';
import 'package:netsieapp/models/API/Episode.dart';
import 'package:netsieapp/models/API/Profile.dart';
import 'dart:io';


Get_All_Categories() async {
  var _Model = Category_Model();
  String url = API_Baseurl+API_Category;

  Response response = await get(url);
  int statusCode = response.statusCode;

  if(statusCode == 200){
    String body = response.body;
    List<dynamic> response_body = await jsonDecode(body);
    _Model.SetCategoryList(response_body);
    return response_body;
  }

  return false;
}


var latestcheck = false;

Get_Latest15_Stories() async {
  var _Model = Story_Model();

  print("Latest: " + latestcheck.toString());
  if(latestcheck == true){
    return _Model.storylist;
  }

  String url = API_Baseurl+API_LatestStoryLast15;

  Response response = await get(url);
  int statusCode = response.statusCode;
  print("Story Request Status Code: " + statusCode.toString());

  if(statusCode == 200){
    String body = response.body;
    List<dynamic> response_body = await jsonDecode(body);
    _Model.SetStoryList(response_body);
    latestcheck=true;
    return response_body;
  }

  return false;
}

GetSeasons_OfStory(id) async {
  var _Model = Season_Model();
  String url = API_Baseurl+API_SpecificStoryWithSeason+id.toString();

  Response response = await get(url);
  int statusCode = response.statusCode;

  if(statusCode == 200){
    String body = response.body;
    List<dynamic> response_body = await jsonDecode(body);
    _Model.setSeasonListOfStory(response_body);
    return response_body;
  }

  return false;
}

GetSeasons_OfStory1(id) async {
  var _Model = Season_Model();
  String url = API_Baseurl+API_SpecificStoryWithSeason+id.toString();

  Response response = await get(url);
  int statusCode = response.statusCode;

  if(statusCode == 200){
    String body = response.body;
    List<dynamic> response_body = await jsonDecode(body);
    return response_body;
  }

  return false;
}

GetEpisodes_OfSeason(id) async {
  var _Model = Episode_Model();
  String url = API_Baseurl+API_EpisodesBySeasonID+id.toString();

  Response response = await get(url);
  int statusCode = response.statusCode;

  if(statusCode == 200){
    String body = response.body;
    List<dynamic> response_body = await jsonDecode(body);
    _Model.setEpisodeListOfStory(response_body);
    return response_body;
  }

  return false;
}


GetStoryByTitle(searchQuery) async {
  var _Model = Story_Model();
  String url = API_Baseurl+API_SearchStoryByTitle+searchQuery.toString();

  Response response = await get(url);
  int statusCode = response.statusCode;

  if(statusCode == 200){
    String body = response.body;
    List<dynamic> response_body = await jsonDecode(body);
    _Model.SetStory_Search(response_body);
    return response_body;
  }

  return false;
}

GetSeasonByTitle(searchQuery) async {
  var _Model = Season_Model();
  String url = API_Baseurl+API_SearchSeasonByTitle+searchQuery.toString();

  Response response = await get(url);
  int statusCode = response.statusCode;

  if(statusCode == 200){
    String body = response.body;
    List<dynamic> response_body = await jsonDecode(body);
    _Model.SetSeason_Search(response_body);
    return response_body;
  }

  return false;
}

GetEpisodeByTitle(searchQuery) async {
  var _Model = Episode_Model();
  String url = API_Baseurl+API_SearchEpisodeByTitle+searchQuery.toString();

  Response response = await get(url);
  int statusCode = response.statusCode;

  if(statusCode == 200){
    String body = response.body;
    List<dynamic> response_body = await jsonDecode(body);
    _Model.SetEpisode_Search(response_body);
    return response_body;
  }

  return false;
}

GetProfile() async {
  var _Model = Profile_Model();
  String url = API_Baseurl+API_GetProfile;
  String url_stories = API_Baseurl+API_GetProfileStories;
  var authkey = await readToken();
  headers["Authorization"] = "Bearer "+authkey;


  Response response = await get(url,headers: headers);
  Response response1 = await get(url_stories,headers: headers);
  int statusCode = response.statusCode;

  if(statusCode == 200){
    String body = response.body;
    String body_Stories = response1.body;
    var response_body = jsonDecode(body);
    var response_body1 = jsonDecode(body_Stories);
    _Model.setProfileData(response_body,response_body1);
    response_body["Stories"] = response_body1;
    return response_body;
  }

  return false;
}


GetSeasonsOfUserStories() async {
  var _Model = Profile_Model();
  var authkey = await readToken();
  headers["Authorization"] = "Bearer "+authkey.toString();

  String url_stories = API_Baseurl+API_UserStorySeasons;
  Response response = await get(url_stories,headers: headers);
  int statusCode = response.statusCode;

  if(statusCode == 200){
    String body = response.body;
    var response_body = await jsonDecode(body);
    _Model.setStoriesWithSeasons(response_body);
    return response_body;
  }

  return false;
}

Get_StoryByCategoryID(id) async {
  var _Model = Category_Model();
  String url = API_Baseurl+API_GetStoryByCategoryID+id.toString();

  Response response = await get(url);
  int statusCode = response.statusCode;

  if(statusCode == 200){
    String body = response.body;
    List<dynamic> response_body = await jsonDecode(body);
    _Model.SetCategoryStoryList(response_body);
    return response_body;
  }

  return false;
}

