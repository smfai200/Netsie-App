import 'package:netsieapp/API/Constants.dart';

class Episode_Model{
  static final _controller = Episode_Model._internal();
  Episode_Model._internal();


  factory Episode_Model() {
    return _controller;
  }

  List<dynamic> episodelist = null;
  int episodelength = 0;
  List<dynamic> search_episodelist = List<Map>();
  Map NewEpisode = Map();
  int i;

  setEpisodeListOfStory(episodes){
    this.episodelist = episodes;
    this.episodelength = this.episodelist.length;

    for (i = 0; i < this.episodelist.length; i++) {
      this.episodelist[i]["Episode_Image"] = API_Baseurl + "/" + this.episodelist[i]["Episode_Image"];
    }

  }

  SetEpisode_Search(episodelist){
    this.search_episodelist = episodelist;
    for(i=0; i<this.search_episodelist.length; i++) {
      this.search_episodelist[i]["Episode_Image"] = API_Baseurl + "/" + this.search_episodelist[i]["Episode_Image"];
    }
  }

  GetEpisodeById(id){
    for(i=0; i<this.episodelist.length; i++) {
      if(this.episodelist[i]["id"] == id){
        return this.episodelist[i];
      }
    }
  }

}