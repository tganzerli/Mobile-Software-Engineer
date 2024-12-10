import 'package:flutter/material.dart';

import 'images_constant.dart';

class SyntraImages extends StatelessWidget {
  final String asset;
  final double? height;
  final double? width;

  const SyntraImages.asset({
    super.key,
    this.height,
    this.width,
  }) : asset = ImagesConstant.asset;
  const SyntraImages.component({
    super.key,
    this.height,
    this.width,
  }) : asset = ImagesConstant.component;
  const SyntraImages.location({
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
