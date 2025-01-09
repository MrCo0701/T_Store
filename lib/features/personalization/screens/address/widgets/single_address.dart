import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, this.selectedAddress = false});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor: selectedAddress
          ? TColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? TColors.darkerGrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? TColors.primary
                      : TColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Duy Hao',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: TSizes.sm / 2),
              const Text('089.992.8347', maxLines: 1, overflow: TextOverflow.ellipsis),
              const Text(
                'T8233 Timmy Coves, South Lianna, Manie, 89132, USA',
                softWrap: true,
              ),
              const SizedBox(height: TSizes.sm / 2)
            ],
          )
        ],
      ),
    );
  }
}
