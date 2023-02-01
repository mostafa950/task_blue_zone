import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:task_blue_zone/controller/login_controller.dart';
import 'package:task_blue_zone/controller/register_controller.dart';

import '../services/settings_services.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      LoginController(),
      permanent: true,
    );
    Get.put(
      RegisterController(),
      permanent: true,
    );
    Get.lazyPut(
          () => SettingsServices(),
      fenix: true,
    );
  }


}
