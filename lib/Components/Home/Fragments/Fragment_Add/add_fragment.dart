import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:netsieapp/models/API/Profile.dart';
import 'Subs/Swiper_pagination.dart';
import '../BottomNavigation.dart';
import 'Subs/AddStory_New.dart';
import 'Subs/AddSeason_New.dart';
import 'Subs/AddEpisode_New.dart';
import 'package:netsieapp/API/Constants.dart';
import 'package:netsieapp/API/Home_Requests.dart';


Widget AddFragment(BuildContext context,Function callback,Function AddCallback,Function dropdown,Function getimage,Function image_getter,_swiperController,_currentIndex,_pageCount,_controllera,_focusNode,Function saveDocument,Function emptystate,Function Logincall){
  readToken().then((result) {
    if(result == 0){
      Logincall();
    }
  });

  return Scaffold(
    backgroundColor: Colors.white,
    bottomNavigationBar: BottomNavigation(callback),
    body: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(child: Swiper(
              index: _currentIndex,
              controller: _swiperController,
              itemCount: _pageCount,
              onIndexChanged: (index) {
                AddCallback(index);
              },
              loop: false,
              itemBuilder: (context, index){
                if(index == 0) {
                  return AddStory_New(dropdown: dropdown,swipe: AddCallback,getimage:getimage,imagegetter:image_getter);
                }else if(index == 1){
                  return FutureBuilder(
                   future: GetProfile(),
                   builder: (context, projectSnap){
                    if ((projectSnap.connectionState == ConnectionState.none &&
                        projectSnap.hasData == null) && projectSnap.data == null) {
                      return Center(child:CircularProgressIndicator());
                    }else if(Profile_Model().story_labels_unique == null){
                      return Center(child:CircularProgressIndicator());
                    }

                    return AddSeason_New(dropdown: dropdown,
                        swipe: AddCallback,
                        getimage: getimage,
                        imagegetter: image_getter);
                  });
                }else{
                  return AddEpisode_New(dropdown: dropdown,swipe: AddCallback,getimage:getimage,imagegetter:image_getter,controllera: _controllera,focusNode: _focusNode,getRichText: saveDocument,emptystate: emptystate);
                }
              },
              pagination: SwiperPagination(
                  builder: CustomPaginationBuilder(
                      activeSize: Size(30.0, 20.0),
                      activeColor: Colors.white,
                      size: Size(30.0, 15.0),
                      color: Colors.black
                  )
              ),
            )),
            SizedBox(height: 10.0),
          ],
        ),
      ],
    ),
  );
}



