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

class RegisterCompanyScreen extends StatelessWidget {
  RegisterCompanyScreen({Key? key}) : super(key: key);

  // injection the screen wit RegisterController class
  RegisterController controller = Get.find();

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
          appBar: appBar(heightScreen),
          // default background in app
          backgroundColor: ColorManager.background,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsetsDirectional.all(paddingOfPage),
                child: Column(
                  children: [
                    /// camera container filed
                    containerOfTopCamera(widthScreen, heightScreen),
                    sizedHeight1(),

                    /// company name filed
                    companyFiled(),
                    sizedHeight2(),

                    /// company active filed
                    companyActiveFiled(),
                    sizedHeight2(),

                    /// phone number filed
                    phoneFiled(widthScreen),
                    sizedHeight2(),

                    /// whats number filed
                    whatsFiled(widthScreen),
                    sizedHeight2(),

                    /// email filed
                    emailFiled(widthScreen),
                    sizedHeight2(),

                    /// country filed
                    countryFiled(widthScreen),
                    sizedHeight2(),

                    /// password filed
                    passwordFiled(widthScreen),
                    sizedHeight1(),

                    /// social media links
                    socialMediaLinks(heightScreen),
                    sizedHeight2(),

                    /// container of bottom camera
                    containerOfBottomCamera(
                      heightScreen: heightScreen,
                      widthScreen: widthScreen,
                    ),
                    sizedHeight1(),

                    /// row of conditions and agree
                    rowOfConditionsAndAgree(heightScreen),
                    sizedHeight2(),

                    /// button for complete register
                    buttonForRegister(
                      heightScreen: heightScreen,
                      widthScreen: widthScreen,
                    ),
                    sizedHeight2(),

                    /// button for login if you have an account
                    buttonForLogin(
                      heightScreen: heightScreen,
                      widthScreen: widthScreen,
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

  AppBar appBar(heightScreen) {
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
        "register_company".tr,
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

  Widget containerOfTopCamera(widthScreen, heightScreen) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: widthScreen / 3,
        height: heightScreen / 7,
        decoration: BoxDecoration(
          color: ColorManager.colorOfContainer,
          borderRadius:
              BorderRadiusDirectional.all(Radius.circular(AppSize.s20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetIconManager.add_photo_1_5x,
              color: ColorManager.primary,
              height: 40,
              width: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "loading_logo".tr,
              style: getMediumStyle(
                color: ColorManager.black,
                fontFamily: FontConstants.fontFamilyTajawal,
                fontSize: widthScreen / 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget companyFiled() {
    return Column(
      children: [
        nameOfFiled("company_name", true),
        sizedHeight1(),
        Container(
          child: defaultTextFormedFailed(
            pController: controller.companyNameController,
            pHintText: "enter_name".tr,
            pWidthOfBorder: AppSize.s0,
            pColorOfBorder: ColorManager.gray,
            pType: TextInputType.text,
            pSuffixIcon: IconButton(
              onPressed: controller.companyNameController.clear,
              icon: Icon(Icons.clear),
            ),
          ),
        ),
      ],
    );
  }

  Widget companyActiveFiled() {
    return Column(
      children: [
        nameOfFiled("company_active", true),
        sizedHeight1(),
        Container(
          child: defaultTextFormedFailed(
            pController: controller.companyActiveController,
            pHintText: "enter_name".tr,
            pWidthOfBorder: AppSize.s0,
            pColorOfBorder: ColorManager.gray,
            pType: TextInputType.name,
          ),
        ),
      ],
    );
  }

  Widget phoneFiled(widthScreen) {
    return Column(
      children: [
        nameOfFiled("phone_number", true),
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

  Widget whatsFiled(widthScreen) {
    return Column(
      children: [
        nameOfFiled("whats_num", true),
        sizedHeight1(),
        Container(
          child: defaultTextFormedFailed(
            pController: controller.whatsNumberController,
            pHintText: "whats_num".tr,
            pWidthOfBorder: AppSize.s0,
            pColorOfBorder: ColorManager.gray,
            pSuffixIcon: flagBuild(widthScreen),
            pType: TextInputType.phone,
          ),
        ),
      ],
    );
  }

  Widget emailFiled(widthScreen) {
    return Column(
      children: [
        nameOfFiled("email", false),
        sizedHeight1(),
        Container(
          child: defaultTextFormedFailed(
            pController: controller.emailController,
            pHintText: "enter_email".tr,
            pWidthOfBorder: AppSize.s0,
            pColorOfBorder: ColorManager.gray,
            pType: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }

  Widget countryFiled(widthScreen) {
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

  Widget passwordFiled(widthScreen) {
    return Column(
      children: [
        nameOfFiled("password", true),
        sizedHeight1(),
        Container(
          child: defaultTextFormedFailed(
            pController: controller.passwordController,
            pHintText: "password".tr,
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

  Widget socialMediaLinks(heightScreen) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            "social_media_links".tr,
            style: getMediumStyle(
              color: ColorManager.black,
              fontFamily: FontConstants.fontFamilyTajawal,
              fontSize: heightScreen / 45,
            ),
          ),
        ),
        sizedHeight1(),
        Container(child: SvgPicture.asset(AssetIconManager.groupIcons)),
      ],
    );
  }

  Widget containerOfBottomCamera({heightScreen, widthScreen}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: widthScreen,
        height: heightScreen / 4,
        decoration: BoxDecoration(
          color: ColorManager.colorOfContainer,
          borderRadius:
              BorderRadiusDirectional.all(Radius.circular(AppSize.s20)),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            starIcon(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetIconManager.add_photo_1_5x,
                    color: ColorManager.primary,
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "loading_logo".tr,
                    style: getMediumStyle(
                      color: ColorManager.black,
                      fontFamily: FontConstants.fontFamilyTajawal,
                      fontSize: widthScreen / 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowOfConditionsAndAgree(heightScreen) {
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

  Widget buttonForRegister({heightScreen, widthScreen}) {
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
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    child: circleForIcon(Icon(
                      Icons.cancel,
                    )),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Text(
                    "features".tr,
                    style: getRegularStyle(
                      color: ColorManager.primary,
                      fontFamily: FontConstants.fontFamilyNoto,
                      fontSize: 12,
                    ),
                  ),
                ),
                sizedHeight2(),
                Row(
                  children: [
                    Container(
                      child: circleForIcon(
                        Icon(Icons.person,color: ColorManager.primary,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "an_additional".tr,
                            style: getRegularStyle(color: ColorManager.black, fontFamily: FontConstants.fontFamilyTajawal , fontSize: 10,),
                          ),
                          Text(
                            "get_more_orders".tr,
                            style: getRegularStyle(color: ColorManager.black, fontFamily: FontConstants.fontFamilyTajawal , fontSize: 10,),

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buttonForLogin({heightScreen, widthScreen}) {
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
}
