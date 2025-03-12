import 'package:flutter/cupertino.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/popups/shimmer_effect.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TShimmerEffect(width: 55, height: 8)
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
