import 'package:flutter/cupertino.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/popups/shimmer_effect.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(children: [
        Expanded(child: TShimmerEffect(width: 150, height: 110)),
        SizedBox(width: TSizes.spaceBtwItems),
        Expanded(child: TShimmerEffect(width: 150, height: 110)),
        SizedBox(width: TSizes.spaceBtwItems),
        Expanded(child: TShimmerEffect(width: 150, height: 110))
      ])
    ]);
  }
}
