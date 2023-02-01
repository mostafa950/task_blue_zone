import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController{

  // this function two switch between company to user and opposite
  Size screenSize(context) => MediaQuery.of(context).size;

  /* these variables to pass to controllers of textFormed
   and to control the value will be return
  */
  var companyNameController = TextEditingController();

  var companyActiveController = TextEditingController();

  var phoneController = TextEditingController();

  var whatsNumberController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var countryController = TextEditingController();

  var emailController = TextEditingController();

  // this variable as the key of form that will check the validation in screen
  GlobalKey<FormState>? keyForm = GlobalKey<FormState>();

  /* this variable to check if the user want to appear password or not in the
  textFormedFiled of password
  */
  bool isSecurePass = true;

  /* this variable to check if the user want to appear password or not in the
  textFormedFiled of confirm password
  */
  bool isSecureConfirmPass = true;

  /* these icons will put in the textFormedFiled of password to show password or
     disappear and this icon will change based on the user this will done by
     method of changePasswordVisibility()
   */
  IconData fabIcon1 = Icons.visibility_off;
  IconData fabIcon2 = Icons.visibility_off;

  /* the method will change the status of isSecure variable and fabIcon and
  condition refers to the first textFormedFiled of password or of confirm pass
   * */
  changePasswordVisibility(condition) {
    /* if condition == 1 this mean the user change the status of the
    textFormedFiled of password
    * */
    if(condition == 1){
      isSecurePass = !isSecurePass;
      fabIcon1 = isSecurePass ? Icons.visibility_off : Icons.visibility;
      update();
    }
    /* else this mean the user change the status of the textFormedFiled of
    confirm password
    * */
    else {
      isSecureConfirmPass = !isSecureConfirmPass;
      fabIcon2 = isSecureConfirmPass ? Icons.visibility_off : Icons.visibility;
      update();
    }
  }
  // this variable to check if user accepted this Terms and Conditions or not
  bool agree = false;

  // icon of the check agree or no and this will change based on user
  IconData agreeIcon = Icons.check_box_outlined;

  /* this method to change the status of the user's answer if he accepted or no
  */
  changeAgree(){
    /* if he accepted, the icon color will become the primary color else the
    icon will return to default status
     */
    agreeIcon = agree ? Icons.check_box : Icons.check_box_outlined;
    agree = !agree;
    update();
  }
}