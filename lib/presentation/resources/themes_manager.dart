import 'package:flutter/material.dart';

import 'colors_manager.dart';
import 'values_manager.dart';
import 'styles_manager.dart';
import 'fonts_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Main Colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.dark,

    // Card Theme
    cardTheme: CardTheme(
      color: ColorManager.primary,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s16,
      ),
    ),

    // Button Theme
    buttonTheme: ButtonThemeData(
      // shape: StadiumBorder(),
      disabledColor: ColorManager.grey,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.primary),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),

    // Text Theme
    textTheme: TextTheme(
      bodyText1:
          getRegularStyle(color: ColorManager.dark, fontSize: FontSize.s16),
      subtitle1:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      headline1:
          getSemiBoldStyle(color: ColorManager.dark, fontSize: FontSize.s20),
      caption:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s16),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey),
      labelStyle: getMediumStyle(color: ColorManager.dark),
      errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      // focused border
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      // error border
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      // focused error border
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    ),

    // Basic Font
    fontFamily: FontConstants.fontFamily,
  );
}
