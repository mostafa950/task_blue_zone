import 'package:flutter/cupertino.dart';
import 'package:task_blue_zone/shared/styles/fonts.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color,fontFamily) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color , required fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color , fontFamily);
}
// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color , required fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color , fontFamily);
}

