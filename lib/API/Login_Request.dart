import 'package:http/http.dart';
import 'package:netsieapp/API/Constants.dart';
import 'dart:convert';

LoginUser_Request(_Model) async {
  String url = API_Baseurl+API_Loginurl;
  Map json = _Model.toMap();

  Response response = await post(url, body: json);

  int statusCode = response.statusCode;
  print("Login Request Status Code: " + statusCode.toString());
  if(statusCode == 200){
    String body = response.body;
    Map response_body = jsonDecode(body);
    API_HeaderAuthorizationToken = response_body["token"];
    await saveToken(API_HeaderAuthorizationToken.toString());
    return true;
  }

  return false;
}

