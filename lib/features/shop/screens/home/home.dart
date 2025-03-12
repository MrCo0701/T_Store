import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:t_store/features/shop/controllers/product_controller.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
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
                    const TPromoSlider(),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    TSectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(const AllProduct()),
                      isSpaceBetween: true,
                      showActionButton: true,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // * Popular Products
                    Obx(() {
                      if (controller.isLoading.value) return const TVerticalProductShimmer();

                      if (controller.featuredProducts.isEmpty) {
                        return Center(
                            child: Text('No Data Found!',
                                style: Theme.of(context).textTheme.bodyMedium));
                      }

                      return TGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index]),
                      );
                    }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
