import 'package:netsieapp/models/Authentication/Signup_model.dart';

class SignUpController{
  var Model =  Signup_Model();
  static final _controller = SignUpController._internal();
  SignUpController._internal();
  String Password;

  factory SignUpController() {
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

      print("SignUp: Email Validation Passed");
      this.Model.Email = text;
      return "";
  }


  String FullName_Validator(String text){
    if(text.length < 5){
      return "Invalid";
    }else if((text.split(" ")).length < 2){
      return "Invalid";
    }

    print("SignUp: FullName Validation Passed");
    this.Model.FullName = text;
    return "";
  }


  String Password_Validator(String text){
    if(text.length < 6){
      return "Invalid";
    }

    this.Password = text;
    print("SignUp: Password Validation Passed");
    return "";
  }

  String ConfirmPassword_Validator(String text){
    print(this.Password);
    print(text);
    if(text.length < 6){
      return "Invalid";
    }else if(this.Password != text){
      return "Invalid";
    }

    print("SignUp: Confirm Password Validation Passed");
    this.Model.Password = text;
    return "";
  }

}