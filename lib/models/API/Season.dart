import 'package:netsieapp/API/Constants.dart';
import 'package:netsieapp/models/API/Story.dart';

class Season_Model{
  static final _controller = Season_Model._internal();
  Season_Model._internal();


  factory Season_Model() {
    return _controller;
  }

  List<dynamic> seasonlist = null;
  List<dynamic> seasonlist_unique = null;
  int seasonlength = 0;
  List<dynamic> search_seasonlist = List<Map>();
  Map NewSeason = Map();
  int i;

  setSeasonListOfStory(seasons) {
    this.seasonlist = seasons;
    this.seasonlength = this.seasonlist.length;
    for (i = 0; i < this.seasonlist.length; i++) {
      this.seasonlist[i]["Season_Image"] =
          API_Baseurl + "/" + this.seasonlist[i]["Season_Image"];
    }
    this.seasonlist_unique = this.seasonlist.toSet().toList();
  }

  SetSeason_Search(seasonlist){
    this.search_seasonlist = seasonlist;
    for(i=0; i<this.search_seasonlist.length; i++) {
      this.search_seasonlist[i]["Season_Image"] = API_Baseurl + "/" + this.search_seasonlist[i]["Season_Image"];
    }
  }

  GetSeasonStory(id){
    for(i=0; i<this.search_seasonlist.length; i++) {
      if(this.search_seasonlist[i]["id"] == id){
        return Story_Model().GetStory_SearchByFK(this.search_seasonlist[i]["Fk_Story"]);
      }
    }
  }
}