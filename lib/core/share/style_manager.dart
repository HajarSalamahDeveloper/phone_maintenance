import 'package:flutter/material.dart';

import 'fonts_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily,
    FontWeight fontWeight, Color color, double heightLine) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight,
      height: heightLine);
}

// regular style content

TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  double height = FontConstants.h0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.regular, color, height);
}
// light text style

TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double height = FontConstants.h0,
}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.light, color, height);
}
// bold text style headline

TextStyle getBoldStyle(
    {double fontSize = FontSize.s16,
    double height = FontConstants.h0,
    required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.bold, color, height);
}

// semi bold text style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12,
    double height = FontConstants.h0,
    required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.semiBold, color, height);
}

// medium text style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12,
    double height = FontConstants.h0,
    required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.medium, color, height);
}
