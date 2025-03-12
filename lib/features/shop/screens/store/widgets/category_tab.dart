import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // * Brand
                const TBrandShowcase(
                  images: [
                    TImages.productImage3,
                    TImages.productImage1,
                    TImages.productImage2
                  ],
                ),
                const TBrandShowcase(
                  images: [
                    TImages.productImage3,
                    TImages.productImage1,
                    TImages.productImage2
                  ],
                ),

                //* Product
                TSectionHeading(title: 'You might like', onPressed: () {}),
                const SizedBox(height: TSizes.spaceBtwItems),
                TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => TProductCardVertical(product: ProductModel.empty()))
              ],
            ),
          ),
        ]);
  }
}
