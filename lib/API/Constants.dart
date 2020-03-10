import 'package:shared_preferences/shared_preferences.dart';


var username = "";
var email = "";
var API_HeaderAuthorizationToken = "";

//const API_Baseurl = "http://192.168.10.2:8000";
//const API_Baseurl = "http://dea04b81.ngrok.io";
const API_Baseurl = "http://159.65.73.13:8002";
const API_Loginurl = "/api/v1/auth/login/";
const API_Signupurl = "/api/v1/auth/register/";
const API_Category = "/api/category/";
const API_Story = "/api/story/";
const API_Season = "/api/season/";
const API_Episode = "/api/episode/";
const API_GetStoryByCategoryID = "/api/category/get_StoryByCategoryId/?id=";
const API_UserStorySeasons = "/api/story/get_UserStoryWithSeasons/";
const API_LatestStoryLast15 = "/api/story/get_Latestfifteen/";
const API_SpecificStoryWithSeason = "/api/season/Get_ByStoryID/?id=";
const API_EpisodesBySeasonID = "/api/episode/Get_BySeasonID/?id=";
const API_SearchStoryByTitle = "/api/story/Search_ByTitle/?title=";
const API_SearchSeasonByTitle = "/api/season/Search_ByTitle/?title=";
const API_SearchEpisodeByTitle = "/api/episode/Search_ByTitle?title=";
const API_GetProfile = "/api/profile/";
const API_GetProfileStories = "/api/story/get_UserStories/";

//Map<String, String> headers = {"Content-type": "application/json"};
Map<String, String> headers = Map<String,String>();


readToken() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = await prefs.getString(key) ?? 0;
  print('read: $value');
  return value;
}

saveToken(value_) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = value_;
  prefs.setString(key, value);
  print('saved $value');
}
