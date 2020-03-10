import 'package:flutter/material.dart';
//import 'package:page_transition/page_transition.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List items = [
    {
      "icon": Icons.person,
      "title": "Favorites",
      "page": stub(),
    },
    {
      "icon": Icons.cloud_download,
      "title": "Downloads",
      "page": stub(),
    },
    {
      "icon": Icons.mood,
      "title": "Dark Mode"
    },
//    {
//      "icon": Feather.info,
//      "title": "About",
//      "page": Container(),
//    },
  ];

  static int stub(){
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
        ),
      ),

      body:  ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          if(items[index]['title'] =="Dark Mode"){
//            return SwitchListTile(
//              secondary: Icon(
//                items[index]['icon'],
//              ),
//              title: Text(
//                items[index]['title'],
//              ),
//              value: Provider.of<AppProvider>(context).theme == Constants.lightTheme
//                  ? false
//                  : true,
//              onChanged: (v){
//                if (v) {
//                  Provider.of<AppProvider>(context, listen: false)
//                      .setTheme(Constants.darkTheme, "dark");
//                } else {
//                  Provider.of<AppProvider>(context, listen: false)
//                      .setTheme(Constants.lightTheme, "light");
//                }
//              },
//            );
          }

          return ListTile(
            onTap: (){
              if(items[index]['title'] == "About"){

              }
            },
            leading: Icon(
              items[index]['icon'],
            ),
            title: Text(
              items[index]['title'],
            ),

          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
