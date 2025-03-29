import 'package:flutter/material.dart';

class CustomTextStyles {
  TextStyle? fontWeight400White({
    required double fontSize,
     Color? color,
  }) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle? fontWeight600White({
    required double fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: color,
    );
  }
  TextStyle? fontWeight500White({
    required double fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: color,
    );
  }
  TextStyle? fontWeight700White({
    required double fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle? fontWeight900White({
    required double fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w900,
      fontSize: fontSize,
      color: color,
    );
  }
}
