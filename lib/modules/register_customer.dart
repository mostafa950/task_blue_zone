import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_blue_zone/controller/register_controller.dart';
import 'package:task_blue_zone/controller/register_controller.dart';
import 'package:task_blue_zone/controller/register_controller.dart';
import 'package:task_blue_zone/shared/components/components.dart';
import 'package:task_blue_zone/shared/styles/colors.dart';
import '../shared/components/components.dart';
import '../shared/components/constance.dart';
import '../shared/styles/assets.dart';
import '../shared/styles/fonts.dart';
import '../shared/styles/styles.dart';
import '../shared/styles/values.dart';

class RegisterCustomerScreen extends StatelessWidget {
  // injection the screen wit RegisterController class
  RegisterController controller =
      Get.put(RegisterController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    // height of the screen
    double? heightScreen = screenSize(context).height;

    // width of the screen
    double? widthScreen = screenSize(context).width;

    // the route of screen
    return GetBuilder<RegisterController>(
      builder: (controller) {
        return Scaffold(
          // appBar return object of AppBar
          appBar: appBar(heightScreen: heightScreen),
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

                    /// this refers to name filed
                    nameFiled(controller: controller,),
                    sizedHeight2(),

                    /// this refers to phone filed
                    phoneFiled(
                      widthScreen: widthScreen,
                      controller: controller,
                    ),
                    sizedHeight2(),

                    /// this refers to email filed
                    emailFiled(
                      controller: controller,
                    ),
                    sizedHeight2(),

                    /// this refers to country filed
                    countryFiled(
                      controller: controller,
                    ),
                    sizedHeight2(),

                    /// this refers to password filed
                    passwordFiled(
                      controller: controller,
                    ),
                    sizedHeight2(),

                    /// this refers to confirm password filed
                    confirmPasswordFiled(
                      controller: controller,
                    ),
                    sizedHeight1(),

                    /// row of conditions and agree
                    rowOfConditionsAndAgree(
                      controller: controller,
                      heightScreen: heightScreen,
                    ),
                    sizedHeight2(),

                    /// button for login
                    buttonForLogin(
                      heightScreen: heightScreen,
                      widthScreen: widthScreen,
                    ),
                    sizedHeight2(),

                    /// button for register if you haven't an account
                    buttonForRegister(
                      widthScreen: widthScreen,
                      heightScreen: heightScreen,
                    ),
                    sizedHeight2(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

AppBar appBar({heightScreen}) {
  return AppBar(
    bottomOpacity: 20,
    backgroundColor: ColorManager.white,
    toolbarHeight: heightScreen / 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(AppSize.s20),
      ),
    ),
    title: Text(
      "register_account".tr,
      style: getMediumStyle(
        color: ColorManager.black,
        fontFamily: FontConstants.fontFamilyTajawal,
        fontSize: AppSize.s20,
      ),
    ),
    centerTitle: true,
    actions: [
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: InkWell(
          onTap: () {
            Get.back();
          },
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
    elevation: 0.0,
  );
}

Widget nameFiled({required controller}) {
  return Column(
    children: [
      nameOfFiled("name", true),
      sizedHeight1(),
      Container(
        child: defaultTextFormedFailed(
          pController: controller.companyNameController,
          pHintText: "name".tr,
          pWidthOfBorder: AppSize.s0,
          pColorOfBorder: ColorManager.gray,
          pType: TextInputType.text,
        ),
      ),
    ],
  );
}

Widget phoneFiled({widthScreen, required controller}) {
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

Widget emailFiled({required controller}) {
  return Column(
    children: [
      nameOfFiled("email", false),
      sizedHeight1(),
      Container(
        child: defaultTextFormedFailed(
          pController: controller.emailController,
          pHintText: "email".tr,
          pWidthOfBorder: AppSize.s0,
          pColorOfBorder: ColorManager.gray,
          pType: TextInputType.emailAddress,
        ),
      ),
    ],
  );
}

Widget countryFiled({required controller}) {
  return Column(
    children: [
      nameOfFiled("country", true),
      sizedHeight1(),
      Container(
        child: defaultTextFormedFailed(
          pController: controller.countryController,
          pHintText: "choose_country".tr,
          pWidthOfBorder: AppSize.s0,
          pColorOfBorder: ColorManager.gray,
          pSuffixIcon: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.keyboard_arrow_down,
              size: AppSize.s30,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget passwordFiled({required controller}) {
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
          pIsSecure: controller.isSecurePass,
          pSuffixIcon: GestureDetector(
            onTap: () {
              controller.changePasswordVisibility(1);
            },
            child: Icon(
              controller.fabIcon1,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget confirmPasswordFiled({required controller}) {
  return Column(
    children: [
      nameOfFiled("confirm_pass", true),
      sizedHeight1(),
      Container(
        child: defaultTextFormedFailed(
          pController: controller.confirmPasswordController,
          pHintText: "password".tr,
          pWidthOfBorder: AppSize.s0,
          pColorOfBorder: ColorManager.gray,
          pIsSecure: controller.isSecureConfirmPass,
          pSuffixIcon: GestureDetector(
            onTap: () {
              controller.changePasswordVisibility(2);
            },
            child: Icon(
              controller.fabIcon2,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget rowOfConditionsAndAgree({heightScreen, required controller}) {
  return Row(
    children: [
      GestureDetector(
        onTap: () {
          controller.changeAgree();
        },
        child: Icon(
          controller.agreeIcon,
          color: ColorManager.primary,
          size: heightScreen / 30,
        ),
      ),
      SizedBox(
        width: 10,
      ),
      RichText(
        text: TextSpan(
          text: 'agree'.tr,
          style: getMediumStyle(
            color: ColorManager.black,
            fontFamily: FontConstants.fontFamilyTajawal,
            fontSize: heightScreen / 40,
          ),
          children: [
            TextSpan(
              text: 'conditions'.tr,
              onEnter: (enter) {},
              style: getMediumStyle(
                color: ColorManager.primary,
                fontFamily: FontConstants.fontFamilyTajawal,
                fontSize: heightScreen / 40,
              ),
            ),
          ],
        ),
      ),
      Spacer(),
      starIcon(),
    ],
  );
}

Widget buttonForLogin({widthScreen, heightScreen}) {
  return Container(
    child: inputButton(
      radius: radiusOfInputBorder,
      text: Text(
        "register_only".tr,
        style: getMediumStyle(
          color: ColorManager.background,
          fontFamily: FontConstants.fontFamilyTajawal,
          fontSize: AppSize.s15,
        ),
      ),
      colorOfBox: ColorManager.primary,
      onTap: () {
        Get.defaultDialog(
          title: "",
          titlePadding: EdgeInsetsDirectional.all(0),
          contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 15),
          content: Column(
            children: [
              Container(
                child: inputButton(
                  height: 40,
                  colorOfBox: ColorManager.primary,
                  text: Text(
                    "success".tr,
                    style: getMediumStyle(
                      color: ColorManager.white,
                      fontFamily: FontConstants.fontFamilyTajawal,
                      fontSize: heightScreen / 50,
                    ),
                  ),
                  width: widthScreen / 1.5,
                ),
              ),
              sizedHeight2(),
              Container(
                child: Text(
                  "have_two".tr,
                  style: getMediumStyle(
                    color: ColorManager.black,
                    fontFamily: FontConstants.fontFamilyTajawal,
                    fontSize: heightScreen / 50,
                  ),
                ),
                width: widthScreen / 3,
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget buttonForRegister({widthScreen, heightScreen}) {
  return Container(
    child: inputButton(
      radius: radiusOfInputBorder,
      text: Text(
        "have_an_account".tr,
        style: getMediumStyle(
          color: ColorManager.primary,
          fontFamily: FontConstants.fontFamilyTajawal,
          fontSize: AppSize.s15,
        ),
      ),
      colorOfBox: ColorManager.background,
      onTap: () {
        Get.offAndToNamed("/LoginScreen");
      },
    ),
  );
}
