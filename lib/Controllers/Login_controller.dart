import 'package:netsieapp/models/Authentication/Login_model.dart';

class LoginController{
  var Model = Login_Model();
  static final _controller = LoginController._internal();
  LoginController._internal();

  factory LoginController() {
    return _controller;
  }

  String Email_Validator(String text){
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if(text.length < 5){
      return "Email is Invalid";
    }else if(!regex.hasMatch(text)){
      return "Email is Invalid";
    }

    print("SignIn: Email Validation Passed");
    this.Model.Email = text;
    return "";
  }

  String Password_Validator(String text){
    if(text.length < 6){
      return "Invalid";
    }

    print("SignIn: Password Validation Passed");
    this.Model.Password = text;
    return "";
  }

}