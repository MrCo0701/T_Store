import 'package:flutter/cupertino.dart';

import '../../utils/constants/sizes.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
      top: TSizes.appBarHeight,
      left: TSizes.defaultSpace,
      right: TSizes.defaultSpace,
      bottom: TSizes.defaultSpace
  );
}