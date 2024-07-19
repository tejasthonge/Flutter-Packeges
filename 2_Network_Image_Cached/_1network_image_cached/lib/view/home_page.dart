

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