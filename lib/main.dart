import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_blue_zone/bind/my_binding.dart';
import 'package:task_blue_zone/controller/login_controller.dart';
import 'package:task_blue_zone/middleware/auth_middle_ware.dart';
import 'package:task_blue_zone/modules/login.dart';
import 'package:task_blue_zone/modules/register_comapny.dart';
import 'package:task_blue_zone/modules/onBoarding.dart';
import 'package:task_blue_zone/modules/register_customer.dart';
import 'package:task_blue_zone/modules/splash.dart';
import 'package:task_blue_zone/services/settings_services.dart';
import 'package:task_blue_zone/shared/network/local_storage.dart';

import 'local/local.dart';
import 'local/local_controller.dart';
import 'modules/login.dart';
import 'modules/onBoarding.dart';
import 'modules/register_comapny.dart';
import 'modules/register_customer.dart';
import 'modules/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

Future initServices() async {
  return Get.putAsync(() => SettingsServices().onInit());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      locale: controller.initialLang,
      initialRoute: "/",
      translations: MyLocale(),
      initialBinding: MyBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/LoginScreen',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/RegisterCustomerScreen',
          page: () => RegisterCustomerScreen(),
        ),
        GetPage(
            name: '/RegisterCompanyScreen',
            page: () => RegisterCompanyScreen()),
        GetPage(
          name: '/OnBoardingScreen',
          page: () => OnBoardingScreen(),
          middlewares: [
            AuthMiddleWare(),
          ],
        ),
      ],
    );
  }
}
