import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //* Header
            const TPrimaryHeaderContainer(
                child: Column(children: [
              //* Appbar
              THomeAppBar(),
              SizedBox(height: TSizes.spaceBtwSections),

              //* Searchbar
              TSearchContainer(
                text: 'Search in store',
                icon: Iconsax.search_normal,
                padding: EdgeInsets.symmetric(horizontal: TSizes.spaceBtwSections),
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              //* Categories
              Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      //* Heading
                      TSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: Colors.white,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),

                      //* Categories
                      THomeCategories()
                    ],
                  )),
              SizedBox(height: TSizes.defaultSpace),
            ])),

            // * Body
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    // * Promo Slider
                    const TPromoSlider(
                      banners: [
                        TImages.promoBanner1,
                        TImages.promoBanner2,
                        TImages.promoBanner3
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    TSectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(const AllProduct()),
                      isSpaceBetween: true,
                      showActionButton: true,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // * Popular Products
                    TGridLayout(
                      itemCount: 8,
                      itemBuilder: (_, index) => const TProductCardVertical(),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
