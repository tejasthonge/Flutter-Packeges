

import 'package:_8connectivity_plus/view/screen_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center( 
        child: Text("Screen One"),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(()=>ScreenTwo());
      },
      child: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}