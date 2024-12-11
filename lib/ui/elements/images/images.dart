import 'package:flutter/material.dart';

import 'images_constant.dart';

class UiImages extends StatelessWidget {
  final String asset;
  final double? height;
  final double? width;

  const UiImages.asset({
    super.key,
    this.height,
    this.width,
  }) : asset = ImagesConstant.asset;
  const UiImages.component({
    super.key,
    this.height,
    this.width,
  }) : asset = ImagesConstant.component;
  const UiImages.location({
    super.key,
    this.height,
    this.width,
  }) : asset = ImagesConstant.location;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      width: width,
      height: height,
    );
  }
}
