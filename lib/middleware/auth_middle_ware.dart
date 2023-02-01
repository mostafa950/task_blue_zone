import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import '../shared/network/local_storage.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  // TODO: implement priority
  // int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (SharedHelper.getData(key: "onBoarding") == "ok")
      return RouteSettings(name: "/LoginScreen");
    else if(SharedHelper.getData(key: "onBoarding") != null)
      return RouteSettings(name: "/OnBoardingScreen");
  }
}
