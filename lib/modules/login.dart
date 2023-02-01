import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_blue_zone/controller/register_controller.dart';
import 'package:task_blue_zone/shared/components/constance.dart';
import 'package:task_blue_zone/shared/network/local_storage.dart';
import 'package:task_blue_zone/shared/styles/assets.dart';
import 'package:task_blue_zone/shared/styles/colors.dart';
import 'package:task_blue_zone/shared/styles/fonts.dart';
import 'package:task_blue_zone/shared/styles/styles.dart';
import 'package:task_blue_zone/shared/styles/values.dart';

import '../../controller/login_controller.dart';
import '../shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  // injection the screen wit LoginController class
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // width of the screen
    double? widthScreen = screenSize(context).width;

    // the route of screen
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          // appBar return object of AppBar
          appBar: appBar(),
          // default background in app
          backgroundColor: ColorManager.background,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsetsDirectional.all(paddingOfPage),
                child: Column(
                  children: [
                    sizedHeight1(),

                    /// this refer to the image
                    imageOfPage(),
                    sizedHeight2(),

                    /// this refer to the container of choose
                    containerChoose(
                      widthScreen: widthScreen,
                    ),
                    SizedBox(
                      height: AppSize.s40,
                    ),

                    /// this filed of phone number
                    phoneNumberFiled(
                      widthScreen: widthScreen,
                    ),
                    sizedHeight2(),

                    /// this filed of password
                    passwordFiled(
                      widthScreen: widthScreen,
                    ),
                    sizedHeight1(),

                    /// this filed of missed password
                    missedPasswordFiled(
                      widthScreen: widthScreen,
                    ),
                    sizedHeight2(),

                    /// button for login
                    loginButtonFiled(),
                    sizedHeight1(),

                    /// this filed refer to word(or)
                    textOrFiled(),
                    sizedHeight1(),

                    /// button for new login
                    registerButtonFiled(),
                    sizedHeight2(),

                    /// this filed refer to word(enter with)
                    enterWithFiled(),
                    sizedHeight2(),

                    /// this filed refer to login with social facebook or google
                    loginWithFiled(),
                    sizedHeight2(),

                    /// this filed refer to word(enter as guest)
                    loginAsGuestFiled(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: ColorManager.background,
      elevation: 0.0,
      toolbarHeight: 50,
      actions: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: circleForIcon(
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: ColorManager.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget imageOfPage() {
    return Image(
      image: AssetImage(
        AssetImageManager.Logo_2,
      ),
    );
  }

  Widget chooseStatus({widthScreen, required String text, isChoose}) {
    return Container(
      width: widthScreen / 2.5,
      height: 50,
      child: Center(
          child: Text(
            text.tr,
            style: getRegularStyle(
              color: isChoose ? ColorManager.background : ColorManager.black,
              fontFamily: FontConstants.fontFamilyNoto,
              fontSize: AppSize.s20,
            ),
          )),
      decoration: BoxDecoration(
        color: isChoose ? ColorManager.primary : ColorManager.background,
        borderRadius: BorderRadiusDirectional.all(Radius.circular(AppSize.s40)),
      ),
    );
  }

  Widget containerChoose({widthScreen}) {
    return Container(
      height: 50,
      decoration: boxDecoration(ColorManager.background, AppSize.s40),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                SharedHelper.saveData(key: "role", value: "user");
                controller.changeChoose();
              },
              child: chooseStatus(
                widthScreen: widthScreen,
                text: "only",
                isChoose: controller.isChoose,
              ),
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                SharedHelper.saveData(key: "role", value: "company");
                controller.changeChoose();
              },
              child: chooseStatus(
                widthScreen: widthScreen,
                text: "company",
                isChoose: !controller.isChoose,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget phoneNumberFiled({widthScreen}) {
    return Column(
      children: [
        nameOfFiled("enter_your_phone", true),
        sizedHeight1(),
        Container(
          child: defaultTextFormedFailed(
            pController: controller.phoneController,
            pHintText: "phone_number".tr,
            pWidthOfBorder: AppSize.s0,
            pColorOfBorder: ColorManager.gray,
            pSuffixIcon: flagBuild(widthScreen),
            pType: TextInputType.phone,
          ),
        ),
      ],
    );
  }

  Widget passwordFiled({widthScreen}) {
    return Column(
      children: [
        nameOfFiled("password", true),
        sizedHeight1(),
        Container(
          child: defaultTextFormedFailed(
            pController: controller.passwordController,
            pHintText: "password".tr,
            pWidthOfBorder: AppSize.s0,
            pColorOfBorder: ColorManager.gray,
          ),
        ),
      ],
    );
  }

  Widget missedPasswordFiled({widthScreen}) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: InkWell(
        onTap: () {},
        child: Text(
          "missed_pass".tr,
          style: getRegularStyle(
            color: ColorManager.red,
            fontFamily: FontConstants.fontFamilyTajawal,
          ),
        ),
      ),
    );
  }

  Widget loginButtonFiled() {
    return Container(
      child: inputButton(
        radius: radiusOfInputBorder,
        text: Text(
          "login".tr,
          style: getMediumStyle(
            color: ColorManager.background,
            fontFamily: FontConstants.fontFamilyTajawal,
            fontSize: AppSize.s15,
          ),
        ),
        colorOfBox: ColorManager.primary,
        onTap: () {
        },
      ),
    );
  }

  Widget textOrFiled() {
    return Text(
      "or".tr,
    );
  }

  Widget registerButtonFiled() {
    return Container(
      child: inputButton(
        radius: radiusOfInputBorder,
        text: Text(
          "register_new".tr,
          style: getMediumStyle(
            color: ColorManager.primary,
            fontFamily: FontConstants.fontFamilyTajawal,
            fontSize: AppSize.s15,
          ),
        ),
        colorOfBox: ColorManager.background,
        onTap: () {
          controller.goNext();
        },
      ),
    );
  }

  Widget enterWithFiled() {
    return Text(
      "enter_with".tr,
      style: getMediumStyle(
        color: ColorManager.black,
        fontFamily: FontConstants.fontFamilyTajawal,
        fontSize: AppSize.s14,
      ),
    );
  }

  Widget loginWithFiled() {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: SvgPicture.asset(
              AssetIconManager.facebook,
            ),
            onTap: () {},
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              AssetIconManager.google,
            ),
          ),
        ],
      ),
    );
  }

  Widget loginAsGuestFiled() {
    return InkWell(
      onTap: () {},
      child: Text(
        "enter_guest".tr,
        style: getRegularStyle(
          color: ColorManager.primary,
          fontFamily: FontConstants.fontFamilyTajawal,
          fontSize: AppSize.s20,
        ),
      ),
    );
  }

}

