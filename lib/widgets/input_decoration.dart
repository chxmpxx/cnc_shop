import 'package:cnc_shop/themes/color.dart';
import 'package:flutter/material.dart';

InputDecoration InputDecorationWidget (context, labelText) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: kColorsGrey),
    contentPadding: new EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    enabledBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10),
      borderSide:  BorderSide(color: kColorsGrey, width: 1),
    ),
    focusedBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10),
      borderSide:  BorderSide(color: kColorsPurple, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10),
      borderSide:  BorderSide(color: kColorsRed, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10),
      borderSide:  BorderSide(color: kColorsRed, width: 2),
    ),

    errorStyle: Theme.of(context).textTheme.bodyText1
  );
}