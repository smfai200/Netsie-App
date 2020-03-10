import 'package:flutter/material.dart';
import 'package:netsieapp/Components/Account/UpdateProfile_screen.dart';

profileActionsAndInfo(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MaterialButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => EditProfile()));
          },
          shape: StadiumBorder(),
          color: Colors.black,
          child: Text(
            "Update Profile Details",
            style:TextStyle(
              color: Colors.white
            )
          ),
        ),
      ],
    ),
  );
}