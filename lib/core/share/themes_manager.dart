import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_maintenance/core/share/style_manager.dart';
import 'package:phone_maintenance/core/share/value_manager.dart';

import 'color_manger.dart';
import 'fonts_manager.dart';

class MyAppThemes {
  static final lightTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    brightness: Brightness.light,
    visualDensity: VisualDensity.standard,
    colorScheme: ColorScheme.light(
      background: AppColor.backgroundcolor,
      primary: AppColor.primaryColor,
      secondary: AppColor.secondColor,
    ),
    appBarTheme: AppBarTheme(
        color: AppColor.secondColor,
        // elevation: AppSize.s0,
        foregroundColor: AppColor.fontColor,

        // shadowColor: AppColor.circleColor,
        // foregroundColor: AppColor.circleColor,
        titleTextStyle:
            getBoldStyle(color: AppColor.fontColor, fontSize: FontSize.s18)),
    dividerTheme: const DividerThemeData(
        thickness: 1, space: 1, color: AppColor.primaryColor),
    scaffoldBackgroundColor: AppColor.background2,
    // appBarTheme: AppBarTheme(),
    textTheme: TextTheme(
        headlineSmall:
            getBoldStyle(color: AppColor.primaryColor, fontSize: FontSize.s24),
        displayLarge: getBoldStyle(color: AppColor.fontColorLogin),
        bodySmall: getRegularStyle(color: AppColor.fontColorLogin),
        titleMedium:
            getBoldStyle(color: AppColor.primaryColor, fontSize: FontSize.s16),
        titleSmall: getRegularStyle(color: AppColor.primaryColor),
        titleLarge: getBoldStyle(
            color: AppColor.sconderyContainerColor, fontSize: FontSize.s12),
        labelLarge: getBoldStyle(color: AppColor.fontColorLogin),
        labelSmall: getMediumStyle(
            color: AppColor.fontColorLogin, fontSize: FontSize.s16)),

    //////////button
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppButtonBorderRadius.r10.h),
      ),
      buttonColor: AppColor.primaryColor,
      disabledColor: AppColor.gray,
    ),
    inputDecorationTheme: const InputDecorationTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppButtonBorderRadius.r10.h),
            ),
            shadowColor: AppColor.primaryColor,
            elevation: 0)),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    brightness: Brightness.dark,
  );
}
