

import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
          Container( 
        
            height: 300,
            width: double.infinity,

            child: Text( 
              "After clickig the back it can not re feathe the image means it onse fathe the image form url then it store loccaly"
            ),
          )

          
        ],),
      ),
      floatingActionButton: FloatingActionButton( 

        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("Go Back"),
      ),
    );
  }
}