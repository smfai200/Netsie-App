import 'package:http/http.dart';
import 'package:netsieapp/API/Constants.dart';
import 'dart:convert';

Signup_Request(_Model) async {
  String url = API_Baseurl+API_Signupurl;
  Map json = _Model.toMap();

  print(json);

  Response response = await post(url, body: json);

  int statusCode = response.statusCode;
  print("Signup Request Status Code: " + statusCode.toString());
  if(statusCode == 201){
    String body = response.body;
    Map response_body = jsonDecode(body);
    email = response_body["email"];
    username = response_body["username"];
    await saveToken(API_HeaderAuthorizationToken.toString());
    return true;
  }

  return false;
}

