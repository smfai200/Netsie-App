import 'package:flutter/material.dart';
import 'package:netsieapp/utilities/constants.dart';
import 'package:netsieapp/models/API/Category.dart';

Widget AddSeason(_image,Function getimage){
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top:20)
        ),
        Center(
          child: _image == null
              ? Text('Please Select an Image for Story')
              : Image.file(_image),
        ),
        Padding(
            padding: EdgeInsets.only(top:20),
            child: FloatingActionButton(
              onPressed: getimage,
              tooltip: 'Pick Image',
              child: Icon(Icons.add_a_photo),
            )
        ),
        Padding(
          padding: EdgeInsets.only(top:20),
        ),
        _buildFullNameTF('Season Title','StoryTitle',2),
        SizedBox(height: 30),
        CategoryDropDown(),
        SizedBox(height: 20),
        _buildFullNameTF('Season Description','StoryDescription',15),
      ],
    ),
  );
}

var validate1 = true;

Widget _buildFullNameTF(Title,CheckTitle,max_lines) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        Title,
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 50.0,
        child: TextField(
          onChanged: (text){
            TextHandler(CheckTitle,text);
          },
          maxLines: max_lines,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            suffixIcon: validate1==true ? Icon(Icons.error, color: Colors.white,size:0):Icon(Icons.error, color: Colors.white),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.title,
              color: Colors.white,
            ),
            hintText: Title,
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

String _selectedCompany;
List<DropdownMenuItem> buildDropdownMenuItems(List categories) {
  List<DropdownMenuItem> items = List();
  for (var cat in categories) {
    items.add(
      DropdownMenuItem(
        value: cat,
        child: Text(cat),
      ),
    );
  }
  print(items);
  return items;
}

Widget CategoryDropDown() {
  var _Model = Category_Model();
  var items = buildDropdownMenuItems(_Model.category_labels);

  return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 50.0,
      child: Padding(
          padding: EdgeInsets.only(left: 10),
          child:DropdownButton(
            value: items[0].value,
            items: items,
            onChanged: onChangeDropdownItem,
          ))
  );
}



void TextHandler(check,text){
  print("Test");
}

onChangeDropdownItem(item) {
  print(item);
}