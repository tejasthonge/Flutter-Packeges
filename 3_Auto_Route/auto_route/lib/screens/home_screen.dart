

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 

      body: Center(
        child: Column( 
          
          children: [ 
          ElevatedButton(onPressed: (){
            
          }, child: const Text("Go to Profile Screen"))
          ],
        ),
      ),
    );
  }
}