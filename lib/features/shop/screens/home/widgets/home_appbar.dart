import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.grey),
          )
        ],
      ),
      action: [
        TCartCounterIcon(
          onPressed: () {},
          iconColor: dark ? TColors.light : TColors.dark,
        )
      ],
    );
  }
}
