import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';



//dart run flutter_native_splash:create --path=native_splash.yaml 

//--path flag is for wher we store comfigatation for that native splash screen
//      --if we write in pubspace.yaml then we dont need of that --path flag 

void main() {

 WidgetsBinding widgetsBinding=  WidgetsFlutterBinding.ensureInitialized();
 FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
 FlutterNativeSplash.remove();

}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     

      home: Scaffold(

        body:Center( 

          child: Text( 

            "Native Flash",
            style: TextStyle( 
              fontSize: 40,
              color: Colors.amber.shade800,
            ),
          ),
        ) 
      )
    );
  }
}


