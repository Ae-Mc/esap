import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuaranteedImage extends StatelessWidget {
  final String asset;
  final String defaultSvgAsset;
  final Color color;
  final double width;
  final double height;
  final BoxFit fit;

  GuaranteedImage(
    this.asset, {
    @required this.width,
    @required this.height,
    this.color,
    this.defaultSvgAsset = "assets/icons/Image.svg",
    this.fit = BoxFit.cover,
  }) {
    assert(color != null || asset != null);
  }

  @override
  Widget build(BuildContext context) {
    Widget image;
    if (asset == null)
      image = SvgPicture.asset(
        defaultSvgAsset,
        width: width,
        height: height,
        color: color,
      );
    else
      image = Image.asset(asset, width: width, height: height, fit: fit);
    return image;
  }
}
