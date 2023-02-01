import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/network/local_storage.dart';

class LoginController extends GetxController {
  // for check if the user is login in by customer or company
  bool isChoose = false;

  // this function two switch between company to user and opposite
  changeChoose() {
    isChoose = !isChoose;
    update();
  }

  /* these variables to pass to controllers of textFormed
   and to control the value will be return
  */
  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  // this variable as the key of form that will check the validation in screen
  GlobalKey<FormState>? keyForm = GlobalKey<FormState>();

  // this variable to check if the user want to appear password or not
  bool isSecure = true;

  /* this icon will put in the textFormedFiled of password to show password or
     disappear and this icon will change based on the user this will done by
     method of changePasswordVisibility()
   */
  IconData fabIcon = Icons.visibility_off;

  // the method will change the status of isSecure variable and fabIcon
  changePasswordVisibility() {
    isSecure = !isSecure;
    fabIcon = isSecure ? Icons.visibility_off : Icons.visibility;
    update();
  }

  goNext(){
    if(SharedHelper.getData(key: "role") == "user"){
      Get.toNamed("/RegisterCustomerScreen");
    }
    else {
      Get.toNamed("/RegisterCompanyScreen");
    }
  }
}
