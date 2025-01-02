import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.margin,
    this.padding = 0,
    this.child,
    this.backgroundColor = TColors.white,
  });

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400),
          color:backgroundColor.withOpacity(0.8)),
    );
  }
}
