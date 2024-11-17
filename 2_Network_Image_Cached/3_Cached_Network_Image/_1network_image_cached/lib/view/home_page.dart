

/*

this is amather way
CachedNetworkImage(
  imageUrl: "http://via.placeholder.com/200x150",
  imageBuilder: (context, imageProvider) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
    ),
  ),
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
),
*/

import 'package:_1network_image_cached/api/image_api_key.dart';
import 'package:_1network_image_cached/view/nex_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 

      body: Column( 

        children: [ 



          CachedNetworkImage(imageUrl: ImageApi.imageApi,  
            progressIndicatorBuilder: (context, url, progress) {
              return CircularProgressIndicator();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NextScreen(),
          ),
        );
        },
        child:Text("Go to the next screen"),)
      
    );
  }
}