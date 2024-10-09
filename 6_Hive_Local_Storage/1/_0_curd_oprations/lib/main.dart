import 'dart:io';
import 'package:_0_curd_oprations/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


//remain hive does not support to stor the bytes like images we can stroe the path of that image 

void main()async {
  WidgetsFlutterBinding.ensureInitialized(); //we are ensuring that the the WidgetsFlutterBinding to the framework
  
  //this following method is inside the path_provider package and it returing the pah of the file where storing the data
  final Directory documetDir = await getApplicationDocumentsDirectory();

  // initializing hive with the path of the directory where storing the data
  Hive.init(documetDir.path);// here pe requre to pass the path of the directory wher store the hive instance in localy or file
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp( 
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade900,
        )  
      ),
      home: HomePage(),
    );
  }
}