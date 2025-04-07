import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/product%20/variation_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());

    return Obx(
      () => Column(
        children: [
          // * -- Selected Attribute Pricing & Description --
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  //* Title, Price and Stock status
                  Row(
                    children: [
                      const TSectionHeading(title: 'Variation', showActionButton: false),
                      const SizedBox(width: TSizes.spaceBtwSections),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //* Actual Price
                          Row(
                            children: [
                              const TProductTitleText(title: 'Price : ', smallSize: true),
                              if (controller.selectedVariation.value.price > 0)
                                Text('\$${controller.selectedVariation.value.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(decoration: TextDecoration.lineThrough)),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              TProductPriceText(price: controller.getVariationPrice())
                            ],
                          ),

                          //* Stock
                          Row(
                            children: [
                              const TProductTitleText(title: 'Stock :', smallSize: true),
                              Text(
                                controller.variationStackStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  // * Variation Description
                  TProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          const SizedBox(height: TSizes.spaceBtwItems),

          // * -- Attributes
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map((attribute) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TSectionHeading(title: attribute.name ?? ''),
                          const SizedBox(height: TSizes.spaceBtwItems / 2),
                          Obx(
                            () => Wrap(
                                spacing: 8,
                                children: attribute.values!.map((attributeValue) {
                                  final isSelected =
                                      controller.selectedAttributes[attribute.name] ==
                                          attributeValue;
                                  final available = controller
                                      .getAttributesAvailabilityInVariation(
                                          product.productVariations!, attribute.name!)
                                      .contains(attributeValue);

                                  return TChoiceChip(
                                      text: attributeValue,
                                      selected: isSelected,
                                      onSelected: available
                                          ? (selected) {
                                              if (selected && available) {
                                                controller.onAttributeSelected(
                                                    product, attribute.name ?? '', attributeValue);
                                              }
                                            }
                                          : null);
                                }).toList()),
                          )
                        ],
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
