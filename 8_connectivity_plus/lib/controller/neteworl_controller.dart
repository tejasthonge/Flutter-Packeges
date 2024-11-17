import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity(); // Connectivity instance

  @override
  void onInit() {
    super.onInit();
    // Correctly listening to connectivity changes; expects a single ConnectivityResult
    _connectivity.onConnectivityChanged.listen(
      (event) => _updateConnectionStatus(event),
    );
  }

  // Function to handle connectivity status change
  void _updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    // If there is no internet connection
    log("Checking for internet connection");
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      // Mobile network available.
      Get.snackbar(" Mobile network available" ,"" ,backgroundColor: Colors.green);
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
      Get.snackbar("Wi-fi is Connected." ,"" ,backgroundColor: Colors.green);


    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      // Ethernet connection available.
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      // Vpn connection active.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
    } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      // Bluetooth connection available.
      Get.snackbar("Bluetooth connection available." ,"" ,backgroundColor: Colors.orange);

    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      // Connected to a network which is not in the above mentioned networks.
      Get.snackbar(" network which is not in the above " ,"" ,backgroundColor: Colors.blue);

    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      // No available network types
      Get.snackbar(
       
        " No available network types " ,"" ,backgroundColor: Colors.red);

    }
  }
}
