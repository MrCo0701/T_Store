
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          TBrandCard(
            showBorder: false,
            onTap: () {},
          ),
          Row(
              children: images.map((image) => brandTopProductImageWidget(image, context)).toList()
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
        child: TRoundedContainer(
          height: 100,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
          margin: const EdgeInsets.only(right: TSizes.sm),
          padding: const EdgeInsets.all(TSizes.md),
          child: Image(fit: BoxFit.contain, image: AssetImage(image)),
        ));
  }
}