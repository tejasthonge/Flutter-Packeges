

import 'package:_8connectivity_plus/controller/neteworl_controller.dart';
import 'package:get/get.dart';

class DipendancyInjection { 

  static void init(){

    Get.put<NetworkController>(
      NetworkController(),
      permanent: true
    );
  }
}