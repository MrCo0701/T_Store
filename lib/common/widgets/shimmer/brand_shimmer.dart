import 'package:flutter/cupertino.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/utils/popups/shimmer_effect.dart';

class TBrandShimmer extends StatelessWidget {
  const TBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const TShimmerEffect(width: 300, height: 80),
      mainAxisExtent: 80,
    );
  }
}
