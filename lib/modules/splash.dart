import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_blue_zone/shared/network/local_storage.dart';
import 'package:task_blue_zone/shared/styles/assets.dart';
import 'package:task_blue_zone/shared/styles/colors.dart';
import 'package:task_blue_zone/shared/styles/values.dart';

import '../shared/components/components.dart';
import '../shared/components/constance.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(Duration(seconds: splashDelay), _goNext);
  }

  _goNext() {
    Get.offNamed("/OnBoardingScreen");
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double? heightScreen = screenSize.height;
    double? widthScreen = screenSize.width;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Center(
          child: Container(
            height: heightScreen,
            width: widthScreen,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                /// as the size in the top
                Container(height: heightScreen/3,),

                /// the image that refer to logo
                Image(
                  image: AssetImage(
                    AssetImageManager.Logo_1,
                  ),
                ),

                /// the size between to widget
                SizedBox(height: heightScreen/3,),

                /// the line in the bottom
                Container(
                  child: myDivider(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
