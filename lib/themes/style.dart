import 'package:cnc_shop/themes/color.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'Inter',
    
    textTheme: const TextTheme(
      // login and register screen
      headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700, color: kColorsPurple),

      // app bar
      headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: kColorsPurple),
      headline3: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: kColorsWhite),

      // headline in body
      headline4: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: kColorsGrey),

      // subtitle
      subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: kColorsPurple),

      // error msg
      bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: kColorsRed),
    ),
  );
}