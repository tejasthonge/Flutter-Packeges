import 'package:_8connectivity_plus/dipendancy_injection.dart';
import 'package:_8connectivity_plus/view/sreen_one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  DipendancyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: ScreenOne(),
    );
  }
}
