import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256.0', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // * Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // * Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$12.0', style: Theme.of(context).textTheme.labelLarge)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // * Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$274.0', style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
      ],
    );
  }
}
