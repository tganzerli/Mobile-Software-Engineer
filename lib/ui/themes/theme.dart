import 'package:flutter/material.dart';
import 'package:mobile_software_engineer/ui/ui.dart';

import '../elements/color/colors_constant.dart';
import '../elements/font_size/font_size.dart';

const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide.none);

const double figmaWidth = 430;

ThemeData lightTheme(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  final font = SyntraFontSize(width);
  return ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        errorStyle: TextStyle(
          color: Color(0xffEB5757),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        fillColor: Color(0xffF2F2F9),
        labelStyle: TextStyle(
          color: Color(0xff333333),
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        border: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        errorBorder: _defaultInputBorder),
    colorScheme: const ColorScheme.light(
      primary: UiColorsConstant.secondary,
      secondary: UiColorsConstant.white50,
      tertiary: UiColorsConstant.white50,
      error: Color(0xffEB5757),
      outline: Colors.transparent,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(56),
          fontWeight: FontWeight.w400,
          color: UiColorsConstant.black900),
      displayMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(42),
          fontWeight: FontWeight.w400,
          color: UiColorsConstant.black900),
      displaySmall: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(36),
          fontWeight: FontWeight.w400,
          color: UiColorsConstant.black900),
      headlineLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(32),
          fontWeight: FontWeight.w600,
          color: UiColorsConstant.black900),
      headlineMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(28),
          fontWeight: FontWeight.w600,
          color: UiColorsConstant.black900),
      headlineSmall: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(24),
          fontWeight: FontWeight.w600,
          color: UiColorsConstant.black900),
      titleLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(21),
          fontWeight: FontWeight.w500,
          color: UiColorsConstant.black900),
      titleMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(18),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.024,
          color: UiColorsConstant.black900),
      titleSmall: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(16),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.014,
          color: UiColorsConstant.black900),
      bodyLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(16),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.014,
          color: UiColorsConstant.black900),
      bodyMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(14),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.06,
          color: UiColorsConstant.black900),
      bodySmall: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(12),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.3,
          color: UiColorsConstant.black900), //Ajustado
      labelLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(14),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.024,
          color: UiColorsConstant.black900),
      labelMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(12),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3,
          color: UiColorsConstant.black900), //Ajustado
      labelSmall: TextStyle(
          fontFamily: 'Roboto',
          fontSize: font.size(10),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.06,
          color: UiColorsConstant.black900),
    ),
    extensions: [
      const UiColors(),
      SyntraSpacing(width, figmaWidth),
    ],
  );
}
