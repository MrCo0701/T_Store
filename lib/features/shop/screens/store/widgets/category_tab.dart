import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_brand.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
              CategoryBrands(category: category),
              const SizedBox(height: TSizes.spaceBtwItems),
              FutureBuilder(
                  future: controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    final response = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: const TVerticalProductShimmer());
                    if (response != null) return response;
                    final products = snapshot.data!;

                    return Column(children: [
                      TSectionHeading(
                          title: 'You might like',
                          onPressed: () => Get.to(
                                AllProduct(
                                  title: category.name,
                                  futureMethod: controller.getCategoryProducts(
                                      categoryId: category.id, limit: -1),
                                ),
                              )),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TGridLayout(
                          itemCount: 4,
                          itemBuilder: (_, index) => TProductCardVertical(product: products[index]))
                    ]);
                  }),
            ],
          )),
    ]);
  }
}
