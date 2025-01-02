import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/features/shop/controllers/home_controller.dart';
import 'package:t_store/utils/constants/colors.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
          items: banners.map((url) => TRoundedImage(imageUrl: url)).toList()
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                TCircularContainer(
                  margin: const EdgeInsets.only(right: 10),
                  width: 20,
                  height: 5,
                  backgroundColor: controller.carousalCurrentIndex.value == i
                      ? TColors.primary
                      : TColors.grey,
                ),
            ],
          ),
        )
      ],
    );
  }
}
