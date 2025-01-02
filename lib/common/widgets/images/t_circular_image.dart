import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height  = 56,
    this.padding = TSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ?? (dark ? TColors.black : TColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: Image(
        fit: fit,
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}
