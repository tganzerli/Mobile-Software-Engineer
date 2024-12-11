import 'package:flutter/material.dart';

/// A class that defines spacing constants for the Ui app.
class UiSpacing extends ThemeExtension<UiSpacing> {
  final double mobileWidth;
  final double figmaWidth;

  /// Extra extra small spacing.
  ///
  /// Size Value: `4`
  late double spacingXXS;

  /// Extra small spacing.
  ///
  /// Size Value: `8`
  late double spacingXS;

  /// Small spacing.
  ///
  /// Size Value: `12`
  late double spacingSM;

  /// Medium spacing.
  ///
  /// Size Value: `16`
  late double spacingMD;

  /// Large spacing.
  ///
  /// Size Value: `24`
  late double spacingLG;

  /// Extra large spacing.
  ///
  /// Size Value: `32`
  late double spacingXL;

  /// Extra extra large spacing.
  ///
  /// Size Value: `48`
  late double spacingXXL;

  /// Extra extra extra large spacing.
  ///
  /// Size Value: `64`
  late double spacingXXXL;

  /// The margin used in the app.
  ///
  /// Size Value: `16`
  late double marginApp;

  /// Constructor for the [UiSpacing] class.
  ///
  /// Initializes the spacing values based on the provided [mobileWidth] and [figmaWidth].
  UiSpacing(
    this.mobileWidth,
    this.figmaWidth, {
    double spacingXXS = 4,
    double spacingXS = 8,
    double spacingSM = 12,
    double spacingMD = 16,
    double spacingLG = 24,
    double spacingXL = 32,
    double spacingXXL = 48,
    double spacingXXXL = 64,
    double marginApp = 16,
  })  : assert(mobileWidth > 0),
        assert(figmaWidth > 0),
        spacingXXS = (spacingXXS / figmaWidth) * mobileWidth,
        spacingXS = (spacingXS / figmaWidth) * mobileWidth,
        spacingSM = (spacingSM / figmaWidth) * mobileWidth,
        spacingMD = (spacingMD / figmaWidth) * mobileWidth,
        spacingLG = (spacingLG / figmaWidth) * mobileWidth,
        spacingXL = (spacingXL / figmaWidth) * mobileWidth,
        spacingXXL = (spacingXXL / figmaWidth) * mobileWidth,
        spacingXXXL = (spacingXXXL / figmaWidth) * mobileWidth,
        marginApp = (marginApp / figmaWidth) * mobileWidth;

  /// Retrieves the [UiSpacing] instance from the [BuildContext].
  static UiSpacing of(BuildContext context) {
    return Theme.of(context).extension<UiSpacing>()!;
  }

  double size(double pxSize) {
    return (pxSize / figmaWidth) * mobileWidth;
  }

  @override
  UiSpacing copyWith({
    double? figmaWidth,
    double? spacingXXS,
    double? spacingXS,
    double? spacingSM,
    double? spacingMD,
    double? spacingLG,
    double? spacingXL,
    double? spacingXXL,
    double? spacingXXXL,
    double? marginApp,
  }) {
    return UiSpacing(
      mobileWidth,
      figmaWidth ?? this.figmaWidth,
      spacingXXS: spacingXXS ?? this.spacingXXS,
      spacingXS: spacingXS ?? this.spacingXS,
      spacingSM: spacingSM ?? this.spacingSM,
      spacingMD: spacingMD ?? this.spacingMD,
      spacingLG: spacingLG ?? this.spacingLG,
      spacingXL: spacingXL ?? this.spacingXL,
      spacingXXL: spacingXXL ?? this.spacingXXL,
      spacingXXXL: spacingXXXL ?? this.spacingXXXL,
      marginApp: marginApp ?? this.marginApp,
    );
  }

  @override
  ThemeExtension<UiSpacing> lerp(
      covariant ThemeExtension<UiSpacing>? other, double t) {
    if (other is! UiSpacing) {
      return this;
    }

    return UiSpacing(
      mobileWidth,
      figmaWidth,
    );
  }
}
