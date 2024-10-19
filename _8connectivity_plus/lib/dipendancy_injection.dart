

import 'package:_8connectivity_plus/controller/neteworl_controller.dart';
import 'package:get/get.dart';

class DependencyInjection {
  
  static void init() {
    Get.put<NetworkController>(NetworkController(),permanent:true);  
  }
}

 //permanent : true
    // means the singleton instance will be retained even after the app is restarted.
    // If you don't want this, you can remove the 
    // all over the screens
    