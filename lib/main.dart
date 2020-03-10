import 'package:flutter/material.dart';
import 'package:netsieapp/Components/Authentication/login_screen.dart';
import 'package:netsieapp/Components/Authentication/signup_screen.dart';
import 'package:netsieapp/Components/Story/storydetails_screen.dart';
import 'package:netsieapp/models/movie_model.dart';
import 'package:netsieapp/Components/Home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
