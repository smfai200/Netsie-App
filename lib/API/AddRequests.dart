import 'package:netsieapp/API/Constants.dart';
import 'package:netsieapp/models/API/Profile.dart';
import 'dart:io';
import 'package:dio/dio.dart';


UpdateProfile(File image) async {
  var _Model = Profile_Model();

  var authkey = await readToken();
  headers["Authorization"] = "Bearer "+authkey;

  var url = API_Baseurl+API_GetProfile;
  Dio dio = new Dio();

  String fileName = image.path.split('/').last;
  FormData formData = FormData.fromMap({
    "User_photo": await MultipartFile.fromFile(image.path, filename:fileName),
    "User_FullName": _Model.ProfileData["User_FullName"],
    "User_Bio": _Model.ProfileData["User_Bio"],
    "User_Country": _Model.ProfileData["User_Country"],
  });

  print(formData);
  var response = await dio.post(url, data: formData,options: Options(
    headers: headers,
  ));
  print(response.data.toString());
  if(response.statusCode == 200){
    return true;
  }
  return false;
}