import 'package:netsieapp/API/Constants.dart';
import 'package:netsieapp/models/API/Episode.dart';
import 'package:netsieapp/models/API/Season.dart';
import 'package:netsieapp/models/API/Story.dart';
import 'dart:io';
import 'package:dio/dio.dart';


AddStory(File image) async {
  var _Model = Story_Model();

  var authkey = await readToken();
  headers["Authorization"] = "Bearer "+authkey;

  var url = API_Baseurl+API_Story;
  Dio dio = new Dio();

  String fileName = image.path.split('/').last;

  FormData formData = FormData.fromMap({
    "Story_Image": await MultipartFile.fromFile(image.path, filename:fileName),
    "Story_Title": _Model.NewStory["Story_Title"],
    "Story_Description": _Model.NewStory["Story_Description"],
    "Story_Category": _Model.NewStory["Story_Category"],
  });

  print(formData);
  var response = await dio.post(url, data: formData,options: Options(
    headers: headers,
  ));
  print(response.data.toString());
  return response.data;
}

AddSeason(File image) async {
  var _Model = Season_Model();

  var authkey = await readToken();
  headers["Authorization"] = "Bearer "+authkey;

  var url = API_Baseurl+API_Season;
  Dio dio = new Dio();

  String fileName = image.path.split('/').last;

  FormData formData = FormData.fromMap({
    "Season_Image": await MultipartFile.fromFile(image.path, filename:fileName),
    "Season_Title": _Model.NewSeason["Season_Title"],
    "Fk_Story": _Model.NewSeason["Fk_Story"],
  });

  print(formData);
  var response = await dio.post(url, data: formData,options: Options(
    headers: headers,
  ));
  print(response.data.toString());
  return response.data;
}

AddEpisode(File image) async {
  var _Model = Episode_Model();

  var authkey = await readToken();
  headers["Authorization"] = "Bearer "+authkey;

  var url = API_Baseurl+API_Episode;
  Dio dio = new Dio();

  String fileName = image.path.split('/').last;

  FormData formData = FormData.fromMap({
    "Episode_Image": await MultipartFile.fromFile(image.path, filename:fileName),
    "Episode_Title": _Model.NewEpisode["Episode_Title"],
    "Episode_TextStory": _Model.NewEpisode["Episode_TextStory"],
    "Episode_Season": _Model.NewEpisode["Episode_Season"],
  });

  print(formData);
  var response = await dio.post(url, data: formData,options: Options(
    headers: headers,
  ));
  print(response.data.toString());
  return response.data;
}