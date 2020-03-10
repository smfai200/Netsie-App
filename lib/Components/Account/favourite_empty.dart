import 'package:flutter/material.dart';

class FavoritesEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favorites",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
                Image.asset(
                  "assets/images/empty.png",
                  height: 300,
                  width: 300,
                ),
                Text(
                  "Nothing is here",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
        ),
      )
    );
  }
}
