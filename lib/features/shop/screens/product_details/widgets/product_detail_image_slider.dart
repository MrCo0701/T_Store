import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:t_store/features/shop/controllers/product%20/image_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark  = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);

    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            //* Main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: TColors.primary,
                            )),
                  );
                })),
              ),
            ),

            // * Image Slider
            Positioned(
              bottom: 30,
              right: 0,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => Obx(() {
                          final imageSelected =
                              controller.selectedProductImage.value == images[index];

                          return TRoundedImage(
                            imageUrl: images[index],
                            width: 80,
                            backgroundColor: dark ? TColors.dark : TColors.white,
                            isNetworkImage: true,
                            border: Border.all(
                                color: imageSelected ? TColors.primary : Colors.transparent),
                            padding: const EdgeInsets.all(TSizes.sm),
                            onPressed: () => controller.selectedProductImage.value = images[index],
                          );
                        }),
                    separatorBuilder: (_, __) =>
                    const SizedBox(width: TSizes.spaceBtwItems),
                    itemCount: images.length),
              ),
            ),

            // * Appbar Icons
            const TAppBar(
              showBackArrow: true,
              action: [
                FavouriteIcon()
              ],
            )
          ],
        ),
      ),
    );
  }
}