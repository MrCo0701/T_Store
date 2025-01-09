
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_text_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // * Image
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 80,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor:
          THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        // * Title, Price, Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: TProductTitleText(
                  title: 'Black Sports shoes',
                  maxLines: 1,
                ),
              ),

              //* Attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style:
                    Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green ',
                    style:
                    Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size ',
                    style:
                    Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'UK 80',
                    style:
                    Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
