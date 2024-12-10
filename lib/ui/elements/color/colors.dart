import 'package:flutter/material.dart';

import 'colors_constant.dart';

class UiColors extends ThemeExtension<UiColors> {
  final Color primary;
  final Color secondary;

  final Color white50;
  final Color gray100;
  final Color gray200;
  final Color gray300;
  final Color gray400;
  final Color gray500;
  final Color gray600;
  final Color gray700;
  final Color gray800;
  final Color black900;

  final Color red50;
  final Color red100;
  final Color red200;
  final Color red300;
  final Color red400;
  final Color redDefault;
  final Color red600;
  final Color red700;
  final Color red800;
  final Color red900;

  final Color green50;
  final Color green100;
  final Color green200;
  final Color green300;
  final Color green400;
  final Color greenDefault;
  final Color green600;
  final Color green700;
  final Color green800;
  final Color green900;

  const UiColors({
    this.primary = UiColorsConstant.primary,
    this.secondary = UiColorsConstant.secondary,
    this.white50 = UiColorsConstant.white50,
    this.gray100 = UiColorsConstant.gray100,
    this.gray200 = UiColorsConstant.gray200,
    this.gray300 = UiColorsConstant.gray300,
    this.gray400 = UiColorsConstant.gray400,
    this.gray500 = UiColorsConstant.gray500,
    this.gray600 = UiColorsConstant.gray600,
    this.gray700 = UiColorsConstant.gray700,
    this.gray800 = UiColorsConstant.gray800,
    this.black900 = UiColorsConstant.black900,
    this.red50 = UiColorsConstant.red50,
    this.red100 = UiColorsConstant.red100,
    this.red200 = UiColorsConstant.red200,
    this.red300 = UiColorsConstant.red300,
    this.red400 = UiColorsConstant.red400,
    this.redDefault = UiColorsConstant.redDefault,
    this.red600 = UiColorsConstant.red600,
    this.red700 = UiColorsConstant.red700,
    this.red800 = UiColorsConstant.red800,
    this.red900 = UiColorsConstant.red900,
    this.green50 = UiColorsConstant.green50,
    this.green100 = UiColorsConstant.green100,
    this.green200 = UiColorsConstant.green200,
    this.green300 = UiColorsConstant.green300,
    this.green400 = UiColorsConstant.green400,
    this.greenDefault = UiColorsConstant.greenDefault,
    this.green600 = UiColorsConstant.green600,
    this.green700 = UiColorsConstant.green700,
    this.green800 = UiColorsConstant.green800,
    this.green900 = UiColorsConstant.green900,
  });

  static UiColors of(BuildContext context) {
    return Theme.of(context).extension<UiColors>()!;
  }

  @override
  ThemeExtension<UiColors> lerp(
    covariant ThemeExtension<UiColors>? other,
    double t,
  ) {
    if (other is! UiColors) {
      return this;
    }

    return UiColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      white50: Color.lerp(white50, other.white50, t)!,
      gray100: Color.lerp(gray100, other.gray100, t)!,
      gray200: Color.lerp(gray200, other.gray200, t)!,
      gray300: Color.lerp(gray300, other.gray300, t)!,
      gray400: Color.lerp(gray400, other.gray400, t)!,
      gray500: Color.lerp(gray500, other.gray500, t)!,
      gray600: Color.lerp(gray600, other.gray600, t)!,
      gray700: Color.lerp(gray700, other.gray700, t)!,
      gray800: Color.lerp(gray800, other.gray800, t)!,
      black900: Color.lerp(black900, other.black900, t)!,
      red50: Color.lerp(red50, other.red50, t)!,
      red100: Color.lerp(red100, other.red100, t)!,
      red200: Color.lerp(red200, other.red200, t)!,
      red300: Color.lerp(red300, other.red300, t)!,
      red400: Color.lerp(red400, other.red400, t)!,
      redDefault: Color.lerp(redDefault, other.redDefault, t)!,
      red600: Color.lerp(red600, other.red600, t)!,
      red700: Color.lerp(red700, other.red700, t)!,
      red800: Color.lerp(red800, other.red800, t)!,
      red900: Color.lerp(red900, other.red900, t)!,
      green50: Color.lerp(green50, other.green50, t)!,
      green100: Color.lerp(green100, other.green100, t)!,
      green200: Color.lerp(green200, other.green200, t)!,
      green300: Color.lerp(green300, other.green300, t)!,
      green400: Color.lerp(green400, other.green400, t)!,
      greenDefault: Color.lerp(greenDefault, other.greenDefault, t)!,
      green600: Color.lerp(green600, other.green600, t)!,
      green700: Color.lerp(green700, other.green700, t)!,
      green800: Color.lerp(green800, other.green800, t)!,
      green900: Color.lerp(green900, other.green900, t)!,
    );
  }

  @override
  UiColors copyWith({
    Color? primary,
    Color? secondary,
    Color? white50,
    Color? gray100,
    Color? gray200,
    Color? gray300,
    Color? gray400,
    Color? gray500,
    Color? gray600,
    Color? gray700,
    Color? gray800,
    Color? black900,
    Color? red50,
    Color? red100,
    Color? red200,
    Color? red300,
    Color? red400,
    Color? redDefault,
    Color? red600,
    Color? red700,
    Color? red800,
    Color? red900,
    Color? green50,
    Color? green100,
    Color? green200,
    Color? green300,
    Color? green400,
    Color? greenDefault,
    Color? green600,
    Color? green700,
    Color? green800,
    Color? green900,
  }) {
    return UiColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      white50: white50 ?? this.white50,
      gray100: gray100 ?? this.gray100,
      gray200: gray200 ?? this.gray200,
      gray300: gray300 ?? this.gray300,
      gray400: gray400 ?? this.gray400,
      gray500: gray500 ?? this.gray500,
      gray600: gray600 ?? this.gray600,
      gray700: gray700 ?? this.gray700,
      gray800: gray800 ?? this.gray800,
      black900: black900 ?? this.black900,
      red50: red50 ?? this.red50,
      red100: red100 ?? this.red100,
      red200: red200 ?? this.red200,
      red300: red300 ?? this.red300,
      red400: red400 ?? this.red400,
      redDefault: redDefault ?? this.redDefault,
      red600: red600 ?? this.red600,
      red700: red700 ?? this.red700,
      red800: red800 ?? this.red800,
      red900: red900 ?? this.red900,
      green50: green50 ?? this.green50,
      green100: green100 ?? this.green100,
      green200: green200 ?? this.green200,
      green300: green300 ?? this.green300,
      green400: green400 ?? this.green400,
      greenDefault: greenDefault ?? this.greenDefault,
      green600: green600 ?? this.green600,
      green700: green700 ?? this.green700,
      green800: green800 ?? this.green800,
      green900: green900 ?? this.green900,
    );
  }
}
