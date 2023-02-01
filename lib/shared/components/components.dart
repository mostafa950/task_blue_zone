import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/assets.dart';
import '../styles/colors.dart';
import '../styles/values.dart';
import 'constance.dart';

/* these methods that repeat more than location in app , these represent as
 components that will used in more than location in app
* */

/* the method refers to the TextFormedFailed widget that will receive some
 parameters to pass it to the TextFormedFailed widget
*  */
Widget defaultTextFormedFailed({
  Widget? pPrefixIcon,
  Widget? pSuffixIcon,
  String? pName,
  String? pHintText,
  TextInputType? pType,
  Function()? pOnTap,
  required TextEditingController? pController,
  var pValidate,
  var pOnChange,
  bool pIsSecure = false,
  var pSufPressed,
  int? pMaxLength,
  var pOnSubmit,
  Color? pColorOfBorder,
  Color? pColorFocusedBorder,
  double? pWidthOfBorder,
}) {
  return TextFormField(
    controller: pController,
    onTap: pOnTap,
    keyboardType: pType,
    validator: pValidate,
    decoration: InputDecoration(
      prefixIcon: pPrefixIcon,
      labelText: pName,
      hintText: pHintText,
      hintStyle: TextStyle(
        fontSize: 12,
      ),
      suffixIcon: pSuffixIcon,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: pColorFocusedBorder ?? ColorManager.gray,
            width: pWidthOfBorder ?? AppSize.s0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: pColorOfBorder ?? Colors.grey, width: pWidthOfBorder ?? AppSize.s0),
      ),
    ),
    onChanged: pOnChange,
    obscureText: pIsSecure,
    maxLength: pMaxLength,
    onFieldSubmitted: pOnSubmit,
  );
}

Widget inputButton({
  Text? text,
  Color? colorOfBox,
  Function()? onTap,
  double height = 50,
  double radius = 50,
  double width = double.infinity,
}) {
  return Container(
    height: height,
    width: width,
    decoration: boxDecoration(colorOfBox , radius),
    child: MaterialButton(
      onPressed: onTap,
      child: Center(
        child: text,
      ),
    ),
  );
}

// this for draw line
Widget myDivider() {
  return Container(
    height: AppSize.s6,
    width: AppSize.s150,
    decoration: BoxDecoration(
      color: ColorManager.background,
      borderRadius: BorderRadiusDirectional.all(Radius.circular(AppSize.s8)),
    ),
  );
}

// this method for return the icon that represent about the current index
Widget _getProperCircle(int index, int currentIndex) {
  if (index == currentIndex) {
    return Icon(
      Icons.circle,
      color: ColorManager.primary,
      size: AppSize.s16,
    );
  } else {
    return Icon(
      Icons.circle,
      color: ColorManager.gray,
      size: AppSize.s16,
    );
  }
}

// this method for color the icon that represent about the current index
Widget circleDraw() {
  return Row(
    children: [
      for (int i = 0; i < 5; i++)
        Padding(
          padding: EdgeInsets.all(AppSize.s4),
          child: _getProperCircle(i, 0),
        )
    ],
  );
}

// this method for draw a square and in side it icon
Widget circleForIcon(Icon icon) {
  return Container(
    height: 38,
    width: 38,
    decoration: boxDecoration(ColorManager.background , AppSize.s12),
    child: Center(child: icon),
  )
  ;
}

// this method to return default BoxDecoration in app
BoxDecoration boxDecoration(color , radius) {
  return BoxDecoration(
    color: color,
    boxShadow: [
      BoxShadow(
          color: Colors.grey, //New
          blurRadius: 25.0,
          offset: Offset(0, 0))
    ],
    borderRadius: BorderRadiusDirectional.all(Radius.circular(radius ?? AppSize.s12)),
  );
}

// this method return star icon that refers that filed is required
Icon starIcon(){
  return Icon(
    Icons.star_border,
    color: ColorManager.colorOfStar,
    size: AppSize.s16,
  );
}

// this method return row contains the name of filed and if it require or no
Widget nameOfFiled(String text , isStar){
  return Row(
    children: [
      Text(
        text.tr,
      ),
      SizedBox(width: AppSize.s10,),
      isStar ? starIcon() : Container(),
    ],
  );
}

// this method to draw flag od Kuwait
Widget flagBuild(widthScreen) {
  return Padding(
    padding: EdgeInsets.all(AppSize.s8),
    child: Container(
      width: widthScreen / 4.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            codeOfCountry,
          ),
          SizedBox(
            width: 5,
          ),
          Image(
            image: AssetImage(AssetImageManager.flag),
          ),
        ],
      ),
    ),
  );
}

// this method to return default SizedBox with height 10
Widget sizedHeight1() {
  return SizedBox(
    height: AppSize.s10,
  );
}

// this method to return default SizedBox with height 25
Widget sizedHeight2() {
  return SizedBox(
    height: AppSize.s25,
  );
}

// this method return the size of the screen
Size screenSize (context){
  return MediaQuery.of(context).size;
}
