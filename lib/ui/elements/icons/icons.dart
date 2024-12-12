import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../color/colors_constant.dart';
import 'icons_constant.dart';

class UiIcons extends StatelessWidget {
  final String asset;
  final Color color;
  final double? height;
  final double? width;

  const UiIcons.bolt({
    super.key,
    this.color = UiColorsConstant.white50,
    this.height,
    this.width,
  }) : asset = IconsConstant.bolt;
  const UiIcons.vector({
    super.key,
    this.color = UiColorsConstant.white50,
    this.height,
    this.width,
  }) : asset = IconsConstant.vector;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      height: height,
      width: width,
    );
  }
}
