import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// this to return the current language of user's device
class LocaleController extends GetxController {
  Locale? initialLang = Get.deviceLocale;
}