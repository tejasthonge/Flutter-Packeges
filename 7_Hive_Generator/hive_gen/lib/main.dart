import 'package:flutter/material.dart';

//hive genarater:
/*
  - as we hive and flutter_hive is used to store the data in the 
  - local storage but this store the objects only and objects are in the form of the 
  - binary format so by using the hive_genarater we can create the modele 
  - by anoting them 
  @hiveType(typeId:<uincNo>)

  -by anoting the like above to the oure modele class and we have to provide the typeId
  - so the type id is the are uniqur for each class

  - then we have to anotete the each variables/fields in the class by using the 
  - @HiveField(id:<uincNo>) 
  - this id form the 0 to 255 and each hase the unique id 

  - afater that we have to know the file in which we are storing the generated files 
  - to store the generated files in our anoted class file we have to write the
  - part <filename.g.dart>
  
  - now we have add the new package known as 
  -# build_runner
  - by using this packge we can run the command and then it will generate the fiele 
  - and store in the <name.g.dart>  file 
  - to generate the command i 

  run flutter packages pub run build_runner build

  - by using this packge we can run the command and then it will generate and store in the part file



*/


import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_gen/models/glocery_model.dart';
import 'package:hive_gen/view/home.dart';

void main() async{ 
  WidgetsFlutterBinding.ensureInitialized(); 
  //firet we have initialize the have 
  await Hive.initFlutter();  //it will get the path where the localy store the data go inside to this function 

  Hive.registerAdapter(GloseryModelAdapter());   //it will register the oure model class adpter

  //it will open the box and the given path for the dato type of GloseyModel 
  await Hive.openBox<GloseryModel>("grocery_list");  //openBox method hase the reutern value Box  
  runApp(const MyApp()); 
} 

class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      home: const MyHomePage(title: 'Flutter Demo Home Page'), 
    ); 
  } 
} 

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
