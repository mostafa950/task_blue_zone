import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_blue_zone/shared/components/components.dart';
import 'package:task_blue_zone/shared/network/local_storage.dart';
import 'package:task_blue_zone/shared/styles/assets.dart';
import 'package:task_blue_zone/shared/styles/colors.dart';
import 'package:task_blue_zone/shared/styles/fonts.dart';
import 'package:task_blue_zone/shared/styles/styles.dart';
import 'package:task_blue_zone/shared/styles/values.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // width of the screen
    double? widthScreen = screenSize(context).width;

    // height of the screen
    double? heightScreen = screenSize(context).height;
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// this filed for image
            containerOfImage(
              heightScreen,
              AssetImageManager.onboarding,
            ),

            /// container of bottom
            containerOfBottom(
              heightScreen,
              widthScreen,
              "start",
            ),
          ],
        ),
      ),
    );
  }
}

Widget containerOfImage(heightScreen, image) {
  return Container(
    height: heightScreen / 1.5,
    margin: EdgeInsetsDirectional.symmetric(
      horizontal: AppSize.s12,
      vertical: AppSize.s12,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(
          4.0,
        ),
        topEnd: Radius.circular(
          4.0,
        ),
      ),
      image: DecorationImage(
        image: AssetImage(
          image,
        ),
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget containerOfBottom(heightScreen, widthScreen, String text) {
  return Container(
    width: widthScreen,
    height: heightScreen / 4,
    decoration: BoxDecoration(
      color: ColorManager.background,
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(
          AppSize.s25,
        ),
        topEnd: Radius.circular(
          AppSize.s25,
        ),
      ),
    ),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: widthScreen / 3,
            top: heightScreen / 15,
          ),
          child: Center(child: circleDraw()),
        ),
        SizedBox(
          height: 10,
        ),
        inputButton(
          width: widthScreen / 1.2,
          onTap: () {
            SharedHelper.saveData(key: "onBoarding", value: "ok");
            Get.offNamed("/LoginScreen");
          },
          height: heightScreen / 15,
          colorOfBox: ColorManager.primary,
          text: Text(
            text.tr,
            style: getMediumStyle(
                color: ColorManager.white,
                fontFamily: FontConstants.fontFamilyTajawal,
                fontSize: AppSize.s20,
            ),
          ),
          radius: AppSize.s20,
        ),
      ],
    ),
  );
}
