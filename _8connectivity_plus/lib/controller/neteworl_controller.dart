import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity(); // Connectivity instance

  @override
  void onInit() {
    super.onInit();
    // Correctly listening to connectivity changes; expects a single ConnectivityResult
    _connectivity.onConnectivityChanged.listen((event) =>_updateConnectionStatus ,);
  }

  // Function to handle connectivity status change
  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    // If there is no internet connection
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: const Text(
          "Internet connection is lost",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        duration: const Duration(days: 1), // Snackbar remains visible until connection restores
        backgroundColor: Colors.red.shade900,
      );
    } else {
      // If internet is restored
      if (Get.isSnackbarOpen) {
        Get.rawSnackbar(
          messageText: const Text(
            "Internet is connected",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          duration: const Duration(seconds: 5), // Display for 5 seconds
          backgroundColor: Colors.green,
        );
      }
    }
  }
}
