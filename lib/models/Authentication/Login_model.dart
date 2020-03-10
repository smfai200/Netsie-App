

class Login_Model{
  static final _controller = Login_Model._internal();
  Login_Model._internal();


  factory Login_Model() {
    return _controller;
  }

  String Email;
  String Password;

  String getEmail(){
    return this.Email;
  }

  String getPassword(){
    return this.Password;
  }

  void setEmail(email){
    this.Email = email;
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

    return map;
  }

}