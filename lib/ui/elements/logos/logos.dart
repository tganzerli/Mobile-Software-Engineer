import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../color/colors_constant.dart';
import 'logos_constant.dart';

class UiLogos extends StatelessWidget {
  final String asset;
  final Color color;
  final double? height;
  final double? width;

  const UiLogos({
    super.key,
    this.color = UiColorsConstant.white50,
    this.height,
    this.width,
  }) : asset = LogosConstant.tractian;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      height: height,
      width: width,
    );
  }
}
