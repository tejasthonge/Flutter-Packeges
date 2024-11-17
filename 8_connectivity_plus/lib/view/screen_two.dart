

import 'package:_8connectivity_plus/view/screen_three.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center( 
        child: Text("Screen Two"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(()=>ScreenTree());
      },
      child: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}