

class Signup_Model{
  static final _controller = Signup_Model._internal();
  Signup_Model._internal();


  factory Signup_Model() {
    return _controller;
  }

  String Email;
  String FullName;
  String Password;

  String getEmail(){
    return this.Email;
  }

  String getFullName(){
      return this.FullName;
  }

  String getPassword(){
      return this.Password;
  }

  void setEmail(email){
    this.Email = email;
  }

  void setFullName(name){
    this.FullName = name;
  }

  void setPassword(value){
    this.Password = value;
  }

  _EmailToUser(){
    return this.Email.split("@")[0];
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _EmailToUser();
    map["password"] = this.Password;
    map["email"] = this.Email;
    map["fullname"] = this.FullName;

    return map;
  }
}