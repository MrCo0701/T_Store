
import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/t_circular_image.dart';
import '../texts/t_brand_text_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder, this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // * Icon
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                image: TImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor:
                dark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(
                width: TSizes.spaceBtwItems / 2),

            // * Text
            Expanded( // * ==> De khong bi loi tran man hinh
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const TBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
