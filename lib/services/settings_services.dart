
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../shared/network/local_storage.dart';

class SettingsServices extends GetxService {
  @override
  Future<SettingsServices> onInit() async {
    await SharedHelper.initial();
    return this;
  }
}