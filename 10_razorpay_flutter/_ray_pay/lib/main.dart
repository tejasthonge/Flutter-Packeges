import 'package:_ray_pay/payment.dart';
import 'package:flutter/material.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PayMent(),
    );
  }
}


/**
 if gotting error 
 Launching lib/main.dart on sdk gphone arm64 in debug mode...
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:processDebugResources'.
> A failure occurred while executing com.android.build.gradle.internal.res.LinkApplicationAndroidResourcesTask$TaskAction
   > Android resource linking failed
     /Users/tejasthonge/coding/github/Flutter-Packeges/10_razorpay_flutter/_ray_pay/build/app/intermediates/packaged_manifests/debug/AndroidManifest.xml:128: error: resource style/Theme.AppCompat.NoActionBar (aka com.example.u_ray_pay:style/Theme.AppCompat.NoActionBar) not found.
     error: failed processing manifest.


* Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.
> Get more help at https://help.gradle.org.

BUILD FAILED in 12s
Running Gradle task 'assembleDebug'...                      

go to https://stackoverflow.com/questions/72770793/erroraapt-error-resource-style-theme-appcompat-light-noactionbar
 */