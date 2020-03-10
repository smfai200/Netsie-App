import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:netsieapp/API/Constants.dart';
import 'package:netsieapp/Components/Story/storydetails_screen.dart';

Widget GetSingle_NetworkImage(imgurl){
  return CachedNetworkImage(
    imageUrl: imgurl,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    placeholder: (context, url) => CircularProgressIndicator(backgroundColor: Colors.black,),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}

Widget GetNetworkImage(imagelist,index){
  return CachedNetworkImage(
    imageUrl: imagelist[index]["Story_Image"],
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    placeholder: (context, url) => CircularProgressIndicator(backgroundColor: Colors.black,),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}


class ContentScroll extends StatelessWidget {
  final List<dynamic> images;
  final String title;
  final double imageHeight;
  final double imageWidth;
  Function onclick;

  ContentScroll({
    this.title,
    this.imageHeight,
    this.imageWidth,
    this.images,
    this.onclick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
//              GestureDetector(
//                onTap: () => print('View $title'),
//                child: Icon(
//                  Icons.arrow_forward,
//                  color: Colors.black,
//                  size: 30.0,
//                ),
//              ),
            ],
          ),
        ),
        Container(
          height: imageHeight,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: (){
                    print("Navigator Active");
                    this.onclick(images,index);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    width: imageWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                          imageUrl: images[index]["Story_Image"],
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => CircularProgressIndicator(backgroundColor: Colors.black,),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        )
//                  child: Image(
//                    image: new CachedNetworkImageProvider(images[index]["Story_Image"],
//                    ), //AssetImage(images[index]) images_[index]["Story_Image"]
//                    fit: BoxFit.cover,
                    ),

                  ));
            },
          ),
        ),
      ],
    );
  }
}
